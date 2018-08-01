class SessionController < ApplicationController
  def new
    redirect_to lists_path if @current_user.present?
  end

  def create
    #find the user based on their email
    user = User.find_by :name => params[:name]
    #if the password authenticates
    if user.present? && user.authenticate(params[:password])
      #remember this user in the session
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid email or password"
      #send them to the login page again with the above error message
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
