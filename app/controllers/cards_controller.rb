class CardsController < ApplicationController
    def index
        @cards=Card.where(:deck_id == request.headers['Deck-ID'])
        render json: {cardList: @cards}, status: :ok
    end
    
    def create
        @card=Card.create(card_params)
        if @card.valid?
            @card.save
            render json: {user: CardSerializer.new(@card)}, status: :created
        else
            render json: {errors: ['Unable to save card']}, status: :not_acceptable
        end
    end

    def update
        @card=Card.find(params[:id])
        if @card.update_attributes(card_params)
            render json: {user: CardSerializer.new(@card)}, status: :updated
        else
            render json: {errors: ['Unable to update user']}, status: :not_acceptable
        end
    end

    def show
        @card=Card.find(params[:id])
    end
    
    def destroy
        @card=Card.find(params[:id])
        if @card.destroy
            render json: {response: ['Card deleted']}, status: :ok
        else
            render json: {errors: ['Unable to delete card']}, status: :not_acceptable
        end
    end

    private

    def card_params
        params
    end
end