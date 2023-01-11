class UsersController < ApplicationController
  def edit
    @user = User.current_user_by(session[:user_id])
    @first_name = @user.first_name
    @last_name = @user.last_name
    @email = @user.email
  end

  def update
    User.current_user_by(session[:user_id])
    user = User.update(user_params)
    redirect_to user_path(user)
  end

  def show
    @user = User.current_user_by(session[:user_id])
    # binding.pry
    @car = @user.car || Car.new
    @house = @user.house || House.new
    @kid = @user.kid || Kid.new
    @pet = @user.pet || Pet.new
    @plan = @user.plan || Plan.new
    @prep_kit = @user.prep_kit || PrepKit.new
    @record = @user.record || Record.new
    return unless params[:email]

    flash[:message] = WeatherFacade.new(params).message
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :car_table, :house_table, :kids_table, :pets_table, :records_table, :plan_table, :prep_kit_table)
  end
end
