class ApplicationController < ActionController::Base
  helper_method :current_user
  # before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    flash[:notice] = "ログインしてください"
    redirect_to login_path unless current_user
  end

  def forbid_login_user
    #forbid = 差し止める
    if current_user
      flash[:notice] = "すでにログインしています"
      redirect_to posts_path
    end
  end

end
