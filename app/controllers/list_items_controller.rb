class ListItemsController < ApplicationController
  def create
    @list_item = ListItem.new(list_item_params)

    if !@list_item.save
      flash.now[:error] = @list_item.errors.full_messages.join("\n")
    end
    redirect_to lists_path(@list_item.list_id)   
  end

  def toggle_completed
    if list_item = ListItem.find_by(id: params[:id])
      list_item.completed = if params[:completed].present? 
        params[:completed]
      else
        !list_item.completed
      end
      list_item.save
      render json: { completed: list_item.completed }, status: :ok        
    else
      render json: {}, status: :not_found
    end
  end

  private

  def list_item_params
    params.require(:list_item).permit(:user_id, :list_id, :description, 
                                      :completed)
  end
end