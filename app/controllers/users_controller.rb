class UsersController < ApplicationController

#This is creating a user
  def create 
    user = User.new(username: params['username'], email: params['email'], password: params['password'])

    if user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages}
    end
  end

end