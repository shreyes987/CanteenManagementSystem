class MenusController < ApplicationController
  def show
    menu = Menu.current_day_order
    render json: {menu: ActiveModel::Serializer::CollectionSerializer.new(menu ,each_serializer: MenuSerializer)}
  end

  def create
    if Menu.create(menu_params)
      render json: {message: "menu saved succesfully" , status: 200}
    else
      render json: {message: "menu not saved" , status: :unprocessable_entity}
    end
  end

  private
  def menu_params
    params.require(:menu).map do |each_menu|
      each_menu.permit(:name , :menu_type , :price)
    end
  end
end
