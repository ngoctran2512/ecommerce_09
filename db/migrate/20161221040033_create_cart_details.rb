class CreateCartDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_details do |t|
      t.references :cart, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
