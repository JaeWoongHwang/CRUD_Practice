class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    # database를 날리고 새로 migrate 한 후 서버를 실행하면 데이터가 없어 에러가 난다. 그때 session.clear하면 다시 초기화 됨.
    # session.clear
    @user||= User.find(session[:user_id]) if User.exists? && session[:user_id]
  end

  def authorize
    unless current_user
      flash[:notice] = "You must sign-up"
      redirect_to '/users/signin'
    end  
  end

  helper_method(:current_user)

end
