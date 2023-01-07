class PagesController < ApplicationController
  skip_before_action :check_login, only: [:welcome]
  
  def welcome
  end
end