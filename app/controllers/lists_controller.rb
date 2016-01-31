class ListsController < ApplicationController
  def show
    @list = List.find_by(id: params[:id])
  end

  def new
    @list = List.new
    @user_id = params[:user_id]
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