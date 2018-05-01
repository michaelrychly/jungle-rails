class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
      # success logic, log them in
      session[:user_id] = user.id
      redirect_to [:root]
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to [:new_session]
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to [:root]
  end
end
