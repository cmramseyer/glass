class CreateProductLines < ActiveRecord::Migration[5.0]
  def change
    create_table :product_lines do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :holes_quantity
      t.integer :polish_type_id
      t.boolean :tempered
      t.integer :quantity
      t.string :description
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
