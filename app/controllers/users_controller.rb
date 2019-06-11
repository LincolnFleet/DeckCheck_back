class Api::V1::UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def create
    @user=User.create(user_params)
    if @user.valid?
      @user.save
      render json: {user: UserSerializer.new(@user)}, status: :created
    else
      render json: {error: 'Unable to create new user'}, status: :not_acceptable
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      render :json => {:response => 'User updated'}, :status => 201
      return @user
    else
      render :json => {:response => 'Unable to update user'}, :status => 422
      return params
    end
  end

  def destroy
    @user=User.find(params[:id])
    if @user.destory
      render :json => {:response => 'User deleted'}, :status => 200
    else
      render :json => {:response => 'Unable to delete user'}, :status => 422
      return params
    end
  end

  private

  def user_params
    params.require(user).permit(:username, :email, :password, :avatar_img)
  end
end
