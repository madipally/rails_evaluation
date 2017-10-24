class ItemsController < ApplicationController
  before_action :set_list, only: [:create, :destroy]

  def create
    @new_item = @list.items.new(item_params)
    respond_to do |format|
      if @new_item.save
        format.html { redirect_to @list, notice: 'Item was successfully created' }
      else
        format.html { redirect_to @list, notice: "#{@new_item.errors.full_messages.map(&:inspect).join(',') }" }
      end
    end
    
    #@new_item = @list.items.new(item_params)
    
    #respond_to do |format|
    #  if @new_item.save
    #     format.html { redirect_to @list, notice: 'Item was successfully created.' }
    #  else
    #      format.html {redirect_to @list }
    #  end
    # end  
    #@new_item = Item.new
    #redirect_to @list
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
