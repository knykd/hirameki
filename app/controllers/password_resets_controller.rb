class PasswordResetsController < ApplicationController
  skip_before_action :require_login, raise: false, only: %i[new create edit update]

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user&.deliver_reset_password_instructions!

      redirect_to login_path, success: t('password_resets.flash.create.success')
    else
      flash.now[:success] = t 'password_resets.flash.create.danger'
      render :new
    end
  end

  def edit
    set_token_user_from_params?
  end

  def update
    set_token_user_from_params?

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user&.change_password!(params[:user][:password])
      redirect_to login_path, success: t('password_resets.flash.update.success')
    else
      render :edit
    end
  end

  private

  def set_token_user_from_params?
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    not_authenticated if @user.blank?
  end
end
