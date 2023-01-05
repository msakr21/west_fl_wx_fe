class DashboardController < ApplicationController
  def show

    @user = User.find(session[:id])
    binding.pry
  end
end