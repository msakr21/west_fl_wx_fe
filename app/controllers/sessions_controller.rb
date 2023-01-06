class SessionsController < ApplicationController
  def new
    user = User.find_or_create_by(email: user_params[:email])
    session[:user_id] = user.id
    redirect_to user_path(user)
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