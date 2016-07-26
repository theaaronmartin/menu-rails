class MenuItemsController < ApplicationController
  def index
    @menu = Menu.find(params[:menu_id])
    @menu_items = @menu.menu_items
  end

  def new
    @menu = Menu.find(params[:menu_id])
    @menu_item = @menu.menu_items.build()
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @menu_item = @menu.menu_items.build(item_params)

    if @menu_item.save
      redirect_to @menu
    else
      render :new
    end
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def update
    @menu_item = MenuItem.find(params[:id])

    if @menu_item.update item_params
      redirect_to @menu
    else
      render :edit
    end
  end

  def show
    @menu = Menu.find(params[:menu_id])
    @menu_item = @menu.menu_items
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    redirect_to @menu_item.menu
  end

  private
    def item_params
      params.require(:menu_item).permit(:name, :description, :price)
    end
end
