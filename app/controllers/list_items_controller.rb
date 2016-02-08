class ListItemsController < ApplicationController
  before_action :user_logged_in
  before_action :check_authorization

  def create
    @list_item = ListItem.new(list_item_params)
    @list_item.user_id = current_user.id

    if !@list_item.save
      response.headers['X-FlashMessages'] = @list_item.errors.full_messages
      render json: {} , status: :bad_request
      return
    end
    render json: { list_item: @list_item }, status: :ok
  end

  def toggle_completed
    if list_item = ListItem.find_by(id: params[:id])
      list_item.toggle_completed!(params[:completed])
      render json: { completed: list_item.completed }, status: :ok     
    else
      render json: {}, status: :not_found
    end
  end

  private

  def list_item_params
    params.require(:list_item).permit(:list_id, :description, 
                                      :completed)
  end

  def user_logged_in
    if !logged_in?  
      flash[:error] = "You must be logged in to edit your list"
      redirect_to root_url
    end
  end

  def check_authorization
    if params[:list_item].try(:[], :list_id).present?
      @list = List.find_by(id: params[:list_item][:list_id])
    elsif params[:id].present?
      @list = ListItem.find_by(id: params[:id]).list
    end

    if @list.nil? || (@list.user_id != current_user.id)
      flash[:error] = "You do not have access to this list item"

      redirect_to root_url
    end
  end
end