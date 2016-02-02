class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to users_list_path(id: current_user.id)
      return
    end
  end

  def create
    if logged_in?
      redirect_to users_list_path(id: current_user.id)
      return
    end

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to users_list_path(id: user.id)
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end