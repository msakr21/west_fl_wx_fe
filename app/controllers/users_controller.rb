class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create!(user_params)
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :car, :house, :kids, :pets, :records, :plan, :prep_kit)
  end
end