class SessionsController < ApplicationController
    
    def create
        @user=User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            auth_token=JWT.encode({user_id: @user.id}, ENV['TOKEN_SECRET'], 'HS256')
            render json: {'AuthToken': auth_token, user_decks: Deck.where(:user_id == @user.id)}, status: :ok
        else
            render json: {errors: ['Unable to authorize username/password']}, status: :unauthorized
        end
    end

end