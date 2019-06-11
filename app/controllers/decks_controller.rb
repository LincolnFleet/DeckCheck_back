class DecksController < ApplicationController
  def index
    @decks=Deck.find_by(user_id: params[:id])
  end

  def show
    @deck=Deck.find(params[:id])
  end

  def create
    @deck=Deck.new(deck_params)
    if @deck.valid?
      @deck.save
      render :json => {:response => 'New deck created'}, :status => 201
      return @deck
    else
      render :json => {:response => 'Unable to create new deck'}, :status => 422
      return params
    end
  end

  def update
    @deck=Deck.find(params[:id])
    if @deck.update_attributes(deck_params)
      render :json => {:response => 'Deck updated'}, :status => 201
      return @deck
    else
      render :json => {:response => 'Unable to update deck'}, :status => 422
      return params
    end
  end

  def destroy
    @deck=Deck.find(params[:id])
    if @deck.destroy
      render :json => {:response => 'Deck deleted'}, :status => 200
    else
      render :json => {:response => 'Unable to delete deck'}, :status => 422
      return params
    end
  end

  private

  def deck_params
    params.require(decks).permit(:user_id, :name, :card_count, :color)
  end
end
