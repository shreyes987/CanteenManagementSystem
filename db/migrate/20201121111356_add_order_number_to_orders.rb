class AddOrderNumberToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_number, :integer
  end
end
