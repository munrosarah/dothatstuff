class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up!"
      redirect_to lists_new_path( user_id: @user.id )
    else
      flash[:error] = @user.errors.full_messages.join("\n")
      redirect_to users_new_path
    end   
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end