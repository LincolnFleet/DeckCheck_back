class UsersController < ApplicationController
  before_action :authorize!, only:  [:update, :destroy]

  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    render json: {username: @user.username, avatar_img: @user.avatar_img, user_decks: Deck.where(:user_id == @user.id)}, status: :ok
  end

  def create
    @user=User.new(user_params)
    if @user.valid?
      @user.save
      @newuser=User.find_by(username: user_params[:username])
      if @newuser && @newuser.authenticate(params[:password])
          auth_token=JWT.encode({user_id: @newuser.id}, ENV['TOKEN_SECRET'], 'HS256')
          render json: {'AuthToken': auth_token}, status: :created
      else
          render json: {errors:['Unable to match username/password']}, status: :unauthorized
      end
    else
      render json: {errors:['Username is invalid or already taken. Please choose another.']}, status: :not_acceptable
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      render json: {user: UserSerializer.new(@user)}, status: :updated
    else
      render json: {errors:['Unable to update user']}, status: :not_acceptable
    end
  end

  def destroy
    @user=User.find(params[:id])
    if @user.destroy
      render json: {response: ['User deleted']}, status: :ok
    else
      render json: {errors: ['Unable to delete user']}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password, :avatar_img)
  end
end
