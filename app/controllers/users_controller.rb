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
    user = User.find_by(email: params[:email])
   if user
     if user.password == params[:password]
       session[:user_id] = user.id
       flash[:notice] = "Sign-in Success"
       redirect_to '/'
     elsif
       flash[:alert] = "Password is not correct"
       redirect_to '/users/signin'
     end
   else
     flash[:alert] = "Your E-mail is not exist"
     redirect_to '/users/signup'
   end
 end

end
