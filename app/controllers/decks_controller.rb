class DecksController < ApplicationController
  before_action :authorize!, only: [:create, :update, :destroy]

  def index
    @decks=Deck.where(:user_id == params[:id])
  end

  def show
    @deck=Deck.find(params[:id])
  end

  def create
    @deck=Deck.new(deck_params)
    if @deck.valid?
      @deck.save
      render json: {deck: DeckSerializer.new(@deck)}, status: :created
    else
      render json: {errors: ['Failed to create deck']}, status: :not_acceptable
    end
  end

  def update
    @deck=Deck.find(params[:id])
    if @deck.update_attributes(deck_params)
      render json: {deck: DeckSerializer.new(@deck)}, status: :updated
    else
      render json: {errors: ['Failed to update deck']}, status: :not_acceptable
    end
  end

  def destroy
    @deck=Deck.find(params[:id])
    if @deck.destroy
      render json:{response: ['Deck deleted']}, status: :ok
    else
      render json: {errors: ['Unable to delete deck']}, status: :not_acceptable
    end
  end

  private

  def deck_params
    plain_id=JWT.decode(params[:deck][:user_id], ENV['TOKEN_SECRET']).first['user_id'].to_s
    params[:deck][:user_id]=plain_id
    params.require(:deck).permit(:user_id, :name, :description, :color, :card_count)
  end
end
