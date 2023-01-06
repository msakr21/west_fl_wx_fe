class UsersController < ApplicationController
  skip_before_action :check_login, only: [:create, :new]
  
  def new
  end

  def create
    user = User.create(user_params)
    redirect_to "/auth/google_oauth2"
  end

  def show
    user = User.find_by_id(session[:user_id])
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :car_table, :house_table, :kids_table, :pets_table, :records_table, :plan_table, :prep_kit_table)
  end
end