class SessionsController < ApplicationController
  skip_before_action :check_login, only: [:new]

  def new
    if User.find_by(email: user_params[:email]).nil?
      user = User.create(user_params)
      session[:user_id] = user.id
      redirect_to edit_user_path(user)
    else
      user = User.find_by(user_params)
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_params
    { email: auth_hash['info']['email'],
      first_name: auth_hash['info']['first_name'],
      last_name: auth_hash['info']['last_name'] }
  end
end
