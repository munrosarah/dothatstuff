class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    # TODO: check to see if the user is already signed in
    redirect_to authentication_sign_in_path
  end
end