class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create!(user_params)
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
    require'pry';binding.pry
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :car_table, :house_table, :kids_table, :pets_table, :records_table, :plan_table, :prep_kit_table)
  end
end