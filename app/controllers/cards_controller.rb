class CardsController < ApplicationController
    def index
        @cards=Card.where(deck_id: request.headers['Deck-ID'])
        # @cards=Card.where(:deck_id == request.headers['Deck-ID'])
        render json: {currentDeck: @cards}, status: :ok
    end
    
    def intakeList
        @errors=[]
        @list = params[:cards]
        @list.each do |card|
            if card['id']
                @oldCard=Card.find(card['id'])
                if card['quantity'] < 1
                    @oldCard.destroy
                else
                    @oldCard.update_attributes(clean_card(card))
                end
            else
                @newCard=Card.new(clean_card(card))
                if @newCard.valid?
                    @newCard.save
                else
                    @errors.push(`Could not save #{card[:name]}`)
                end
            end
        end
        render json: {cards: Card.where(deck_id:request.headers['Deck-ID']), errors:@errors}, status: :ok
        # render json: {cards: Card.where(:deck_id == request.headers['Deck-ID']), errors:@errors}, status: :ok
    end

    def create
        @card=Card.new(card_params)
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
        params.require(:card).permit(
            :api_id,
            :name,
            :quantity,
            :colors,
            :colorIdentity,
            :full_type,
            :supertypes,
            :types,
            :subtypes,
            :manaCost,
            :cmc,
            :rarity,
            :set,
            :loyalty,
            :power,
            :toughness,
            :text,
            :imageUrl,
            :flavor,
            :gameFormat,
            :deck_id
        )
    end

    def clean_card(obj)
        obj.permit(
            :api_id,
            :name,
            :quantity,
            :colors,
            :colorIdentity,
            :full_type,
            :supertypes,
            :types,
            :subtypes,
            :manaCost,
            :cmc,
            :rarity,
            :set,
            :loyalty,
            :power,
            :toughness,
            :text,
            :imageUrl,
            :flavor,
            :gameFormat,
            :deck_id
        )
    end
end