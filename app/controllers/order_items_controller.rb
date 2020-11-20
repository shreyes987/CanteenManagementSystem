class OrderItemsController < ApplicationController

  def create
    # order_item =  OrderItem.create(order_items_params)
    order_item = OrderItem.create_order_items(params, current_user)
    if order_item
      render json: {message: "items added sucessfully" , status: 200}
    else
      render json: {message: "failed in adding items" , status: :unprocessable_entity}
    end
  end
end
