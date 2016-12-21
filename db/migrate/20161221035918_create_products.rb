class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.decimal :price
      t.string :decription
      t.string :image
      t.boolean :status

      t.timestamps
    end
  end
end
