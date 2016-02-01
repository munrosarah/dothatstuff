class ListItemsController < ApplicationController
  def create
    @list_item = ListItem.new(list_item_params)

    if !@list_item.save
      flash.now[:error] = @list_item.errors.full_messages.join("\n")
    end
    redirect_to lists_path(@list_item.list_id)   
  end

  def check_off

    flash.now[:notice] = 'PLACE HOLDER FOR CHECK_OFF ' + params[:id]
    render json: { completed: true }, status: :ok
  end

  def uncheck
    flash.now[:notice] = 'PLACE HOLDER FOR UNCHECK'
  end

  private

  def list_item_params
    params.require(:list_item).permit(:user_id, :list_id, :description, 
                                      :completed)
  end
end