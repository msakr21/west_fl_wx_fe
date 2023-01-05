class UsersController < ApplicationController
  def new
  end
  def create
    User.create!(user_params)
    redirect_to "/users/show"
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :car, :house, :kids, :pets, :records, :plan, :prep_kit)
  end
end