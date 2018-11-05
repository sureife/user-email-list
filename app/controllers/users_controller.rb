class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :four_oh_four

  # GET /users
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
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
    @user = User.new(user_params)

    @user.save!
    
    flash[:notice] = 'User was successfully created.'
    redirect_to @user
  rescue ActiveRecord::RecordInvalid => error
    flash.now[:error] = 'Invalid Input, Please check errors'
    render :new
  end

  # PATCH/PUT /users/1
  def update
    @user.update!(user_params)
    flash[:notice] = 'User was successfully updated.'
    redirect_to @user
  rescue ActiveRecord::RecordInvalid => error
    flash.now[:error] = 'Invalid Input, Please check errors'
    render :edit
  end

  # DELETE /users/1
  def destroy
    
    unless @user.admin?
      flash[:error] = 'Customers cannot be deleted' 
      return redirect_to users_url
    end
    if @user.destroy  
      flash[:notice] = 'User was successfully deleted.'
      return redirect_to users_url
    else
      flash[:notice] = 'User could not be deleted.'
      return redirect_to users_url
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def four_oh_four
    flash[:error] = "User with id- #{params[:id]} - does not exist"
    redirect_to users_url
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
