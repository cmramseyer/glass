class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.integer :thickness
      t.integer :max_width
      t.integer :max_height
      t.float :price_per_m2

      t.timestamps
    end
  end
end
