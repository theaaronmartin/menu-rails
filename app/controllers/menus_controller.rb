class MenusController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    @menus = Menus.new
  end

  def create
    @menus = Menus.new(menu_params)

    if @menus.save
      redirect_to @menus
    else
      render :new
    end
  end

  def edit
    @menus = Menus.find(params[:id])
  end

  def update
    @menus = Menus.find(params[:id])

    if @menus.update menu_params
      redirect_to @menus
    else
      render :edit
    end
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def destroy
    @menus = Menus.find(params[:id])
    @menus.destroy

    redirect_to menu_items_path
  end

  private
    def menu_params
      params.require(:menu).permit(:name)
    end
end
