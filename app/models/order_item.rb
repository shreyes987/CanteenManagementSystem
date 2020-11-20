class OrderItem < ApplicationRecord
  belongs_to :order

  def self.create_order_items(params , current_user)
    order = Order.new
    order.order_status = "INKITCHEN"
    order.payment_status = "UNPAID"
    order.order_amount = Order.calculate_total_amount(params[:order_items])
    order.user_id =Order.add_user_id(order , current_user)
    if order.save
      params[:order_items].each do |order_item|
        order_item[:order_id] = order.id
      end
      if OrderItem.create(params.require(:order_items).map do |order_item|
        order_item.permit(:name , :order_id , :menu_id)
      end)
        return true
      else
        return false
      end
    end
  end

end
