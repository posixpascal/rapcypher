class Api::V1::UsersController < ApplicationController
  def index
    @users = [User.last, User.last, User.last] * 3
    render json: UserSerializer.render(@users)
  end

  def create
  end

  def show
  end

  def delete
  end

  def update
  end

  def new
  end

  def edit
  end
end
