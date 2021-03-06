require 'byebug'

class ApplicationController < ActionController::API
  include ExceptionHandler
  
  JWT_SECRET = Rails.application.secret_key_base.to_s
  before_action :authorized, except: [:welcome, :index, :show]

  def encode_token(payload)
    JWT.encode(payload, "flobble")
  end

  def auth_header
   header = request.headers['Authorization']
  end

  def decoded_token 
    if auth_header
      token = auth_header.gsub(/[\"]/, " ").split(" ")[1]
      begin
       JWT.decode(token, "flobble", true, { algorithm: 'HS256'})  
      rescue JWT::DecodeError
        [{}]
      end
    else
    end
  end

  def current_user
    if decoded_token
      if @user_id = decoded_token[0]['user_id'] 
         @user = User.find(@user_id)
      else
      end

    else
    end
  end

  def logged_in?
    !!current_user 
  end

  def authorized
    redirect_to "/welcome" unless logged_in?
  end

  def welcome
    render json: { message: "Please log in" }
  end

end


