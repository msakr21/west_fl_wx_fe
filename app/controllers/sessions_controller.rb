class SessionsController < ApplicationController
  def create
    auth_hash= request.env['omniauth.auth']
    google_id = auth_hash[:uid]
    eemail = auth_hash[:info][:email]
    token = auth_hash[:credentials][:token]

    user = User.find_or_create_by(email: eemail)
    binding.pry
    user.update(google_id: google_id, token: token)

    session[:user_id] = user.id
    binding.pry
    redirect_to '/dashboard'
  end
end