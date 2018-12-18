class CreateCuts < ActiveRecord::Migration[5.0]
  def change
    create_table :cuts do |t|
      t.integer :program_id
      t.integer :order_id
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
