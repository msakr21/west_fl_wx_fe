class UsersController < ApplicationController
  # def new
  #   user = User.find_by_id(session[:user_id])
  #   @email = user.email
  #   @first_name = user.first_name
  #   @last_name = user.last_name
  # end
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
    params.permit(:first_name, :last_name, :email, :car, :house, :kids, :pets, :records, :plan, :prep_kit)
  end
end