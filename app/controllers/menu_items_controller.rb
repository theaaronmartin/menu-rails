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
      @menu_items = Menu.find(params[:menu_id]).menu_items
      respond_to do |format|
        format.html {
              redirect_to @menu
            }# will render the default view for this action
        format.json
      end
    end
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def update
    @menu_item = MenuItem.find(params[:id])

    if @menu_item.update item_params
      redirect_to menu_item_path
    else
      render :edit
    end
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    redirect_to @menu_item.menu
  end

  def search
  end

  def search_results
    @menu = Menu.find(params[:menu_id])
    @menu_items = @menu.menu_items.where("name like ?", "%#{params[:query]}%")
    @menu = Menu.find(params[:menu_id])
  end

  private
    def item_params
      params.require(:menu_item).permit(:name, :description, :price)
    end
end
