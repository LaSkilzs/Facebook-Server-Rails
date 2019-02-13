class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :show]
  

#This is creating a user

  # GET / users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  #GET/users/{username}
  def show
    render json: @user, status: :ok
  end

  #POST /users
  def create 
    @user = User.new(username: params['username'], email: params['email'], password: params['password'])

    if @user.save
      token = encode_token({ user_id: @user.id})
      render json: {user: @user, jwt: token}
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

    def profile 
    if @user
      render json: { user: @user, photo: @user.photos}
    else
      render json: { message: "Error, need right JWT"}
    end
  end

  #PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages}
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end


  private

  def find_user
    @user = User.find_by(username: params[:username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found'}
    end
  end

  def user_params
    params.permit(:username, :email, :password)
  end

end