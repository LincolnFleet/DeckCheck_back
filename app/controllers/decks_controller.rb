class DecksController < ApplicationController
  before_action :authorize!, only: [:create, :update, :destroy]

  def index
    @decks=[]
    @decks<<Deck.where(user_id:JWT.decode(request.headers['AuthToken'], ENV['TOKEN_SECRET']).first)
    # @decks=Deck.where(:user_id == JWT.decode(request.headers['AuthToken'], ENV['TOKEN_SECRET']).first)
    render json: {decks: @decks}, status: :ok
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
    if authorize!
      @deck=Deck.find(params[:id])
      @cards=Card.where(:deck_id == params[:id])
      if @deck.destroy && @cards.destroy
        render json:{response: ['Deck deleted']}, status: :ok
      else
        render json: {errors: ['Unable to delete deck']}, status: :not_acceptable
      end
    else
      render json: {errors: ["You must be signed in as this deck's owner to delete it"]}, status: :not_authorized
    end
  end

  private

  def deck_params
    plain_id=JWT.decode(params[:deck][:user_id], ENV['TOKEN_SECRET']).first['user_id']
    params[:deck][:user_id]=plain_id
    params.require(:deck).permit(:user_id, :name, :description, :color, :card_count)
  end
end
