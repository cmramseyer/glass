class AddNewColumnsInCuts < ActiveRecord::Migration[5.0]
  def change
    add_column :cuts, :width, :integer
    add_column :cuts, :height, :integer
    add_column :cuts, :tracking_id, :integer
    add_column :cuts, :quantity, :integer
  end
end
