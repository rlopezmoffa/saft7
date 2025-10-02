class HomeController < ApplicationController
  # before_action :authenticate_user!
  def index
    email = Session.new(current_user).get_user_email
  end
end
