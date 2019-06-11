class SessionsController < ApplicationController
    
    def create
        @user=User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            puts ENV['TOKEN_SECRET']
            token=JWT.encode({user_id: @user.id}, ENV['TOKEN_SECRET'], 'HS256')
            puts 'after token'
            render json: {auth_token: token, user_decks: Deck.where(:user_id == @user.id)}, status: :ok
        else
            render json: {errors: 'Unable to authorize username/password'}, status: :unauthorized
        end
    end

end