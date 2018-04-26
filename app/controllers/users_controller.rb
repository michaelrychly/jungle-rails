class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)

    if @users.save
      session[:user_id] = user.id
      redirect_to [:products], notice: "User created!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:users).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
