class ListsController < ApplicationController
  before_action :user_logged_in
  before_action :check_authorization, only: :show

  def show
    @list = List.find_by(id: params[:id])
  end

  def new
    @list = List.new

    if current_list = List.find_by(user_id: current_user.id)
      flash[:error] = 'Do That Stuff currently only supports one list per user'
      redirect_to lists_path(current_list)
      return
    end
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path(@list)
    else
      flash[:error] = @list.errors.full_messages.join("\n")
      redirect_to lists_new_path, user_id: current_user.id
    end   
  end

  private

  def list_params
    params.require(:list).permit(:title) 
  end

  def user_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to view your list"
      redirect_to root_url
    end
  end

  def check_authorization
    @list = List.find_by(id: params[:id])

    if @list.nil? || (@list.user_id != current_user.id)
      flash[:error] = "You do not have access to this list"
      redirect_to root_url
    end
  end
end