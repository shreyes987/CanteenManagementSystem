class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :payment_status
      t.string :order_status
      t.integer :order_amount
      t.timestamps
    end
  end
end
