class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(user_params)
    session[:user_id] = user.id
    redirect_to '/users/new'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_params
    {email: auth_hash['info']['email'],
     first_name: auth_hash['info']['first_name'],
     last_name: auth_hash['info']['last_name']}
  end
end