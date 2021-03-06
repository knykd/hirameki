class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create destroy]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to words_path, success: t('user_sessions.flash.create.success')
    else
      flash.now[:danger] = t 'user_sessions.flash.create.danger'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('user_sessions.flash.destroy.success')
  end
end
