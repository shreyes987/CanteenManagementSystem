class OrderSerializer < ActiveModel::Serializer
  attributes :id , :order_number , :order_status , :order_amount , :order_item_list

  def order_item_list
    order_items = OrderItem.where("order_id = ?", object.id)
    ActiveModel::Serializer::CollectionSerializer.new(order_items ,each_serializer: OrderSerializer)
  end
end
