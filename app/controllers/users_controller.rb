class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destroy

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if !current_user.admin? && current_user.id != params[:id]
      redirect_to root_url
    else
      @user = User.find(params[:id])
    end
  end

  # POST /users
  # POST /users.json
  def create
    p = user_params
    if user_params[:password] != user_params[:password_confirmation]
      flash[:warning] = 'Passwords do not match'
      redirect_to(root_url)
      return
    end
    p.delete(:password_confirmation)
    @user = User.new(p)

    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account'
      redirect_to root_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do
      if @user.update(user_params)
        flash[:success] = 'Profil mis a jour'
        redicted_to @user
      else
        render 'edit'
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation)
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def send_activation
    UserMailer.account_activation(@user).deliver_now
  end
end
