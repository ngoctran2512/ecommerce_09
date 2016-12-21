class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :status
      t.string :totalPrice
      t.string :decimal

      t.timestamps
    end
  end
end
