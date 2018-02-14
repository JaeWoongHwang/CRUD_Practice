class UsersController < ApplicationController
  def signup
  end

  def signin
  end

  def signout
    session.clear
    flash[:notice] = "Sign-out Success"
    redirect_to '/'
  end

  def register
    User.create(
      email: params[:email],
      password: params[:password]
    )
    flash[:notice] = "Sign-up Success"
    redirect_to '/'
  end

  def signin_session
    users = User.find_by(email: params[:email])
    if users
      if users.password == params[:password]
        session[:user_id] == users.id
        flash[:notice] = "Sign-in Success"
        redirect_to '/'
      elsif
        flash[:alert] = "Password is not correct"
        redirect_to '/users/signin'
      end
    else
     flash[:alert] = "Your email is not exist"
     redirect_to '/users/signup'
    end
  end

end
