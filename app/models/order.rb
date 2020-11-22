class Order < ApplicationRecord
  has_many :order_items
  validates :order_status, inclusion: { in: %w(INKITCHEN PERPARING SERVED) }
  after_create :set_order_number
  validates :payment_status, inclusion: {in: %w(PAID UNPAID)}


  def self.calculate_total_amount(order_items)
    total_amount = 0
    order_items.each do |order_item|
      menu = Menu.find_by_id(order_item[:menu_id])
      total_amount = total_amount + menu.price
    end
    return total_amount
  end

  def self.add_user_id(order , current_user)
    if(current_user != "Guest")
      order.user_id = current_user.id
    end
  end

  def self.set_intial_order_status(order)
    order.order_status = "INKITCHEN"
  end

  def self.set_intial_payment_status(order)
    order.payment_status = "UNPAID"
  end

  private
  def set_order_number
    self.order_number = self.id + 100
    self.update_column(:order_number , self.order_number)
  end

end
