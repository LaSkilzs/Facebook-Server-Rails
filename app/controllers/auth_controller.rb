class AuthController < ApplicationController
  #This is the signin
 skip_before_action :authorized, only: [:authenticate]
 
  def authenticate
   
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = encode_token({ user_id: user.id})
      render json: {user: user, jwt: token }
    else
    render json: { error: "Login Error"}, status: :unauthorized
    end
  end
end 

 


