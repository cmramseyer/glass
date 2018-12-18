class CreatePolishTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :polish_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
