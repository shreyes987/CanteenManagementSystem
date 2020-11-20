class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :name
      t.references :order
      t.references :menu
      t.timestamps
    end
  end
end
