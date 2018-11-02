class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    redirect_to @user, notice: 'User was successfully created.'
  rescue ActiveRecord::RecordInvalid => error
    render :new
  end

  # PATCH/PUT /users/1
  def update
    @user.update!(user_params)
    redirect_to @user, notice: 'User was successfully updated.'
  rescue ActiveRecord::RecordInvalid => error
    render :edit
  end

  # DELETE /users/1
  def destroy
    redirect_to users_url, notice: 'Customers cannot be deleted' unless @user.admin?
    if @user.destroy  
      redirect_to users_url, notice: 'User was successfully deleted.'
    else
      redirect_to users_url, notice: 'User could not be deleted.'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
