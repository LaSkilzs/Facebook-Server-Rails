class AuthController < ApplicationController
  #This is the signin

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate
  end

  def authenticate
  end
end