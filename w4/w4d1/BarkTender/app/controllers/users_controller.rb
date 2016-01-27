class UsersController < ApplicationController


  def index
    render json: User.all
    # render json: user_params
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render( json: user.errors.full_messages, status: :unprocessable_entity )
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render( json: user.errors.full_messages, status: :unprocessable_entity )
    end
  end

  def destroy
    user = User.find(params[:id])
    render json: params
    user.destroy!
    # index
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

end
