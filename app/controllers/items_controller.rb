class ItemsController < ApplicationController
  before_action :set_list, only: [:create, :destroy]

  def create
    @list.items.create(item_params)
    @new_item = Item.new
    redirect_to @list
  end

  def destroy
    @list.items.find(params[:id]).destroy
    redirect_to @list
  end

  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def item_params
      params.require(:item).permit(:name,tag_ids:[])
    end
end
