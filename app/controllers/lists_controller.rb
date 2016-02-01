class ListsController < ApplicationController
  def show
    @list = List.find_by(id: params[:id])
  end

  def new
    @list = List.new
    @user_id = params[:user_id]

    if current_list = List.find_by(user_id: @user_id)
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
      redirect_to lists_new_path, user_id: @list.user_id
    end   
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :title)
  end
end