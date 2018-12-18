class RemoveColumnsInCuts < ActiveRecord::Migration[5.0]
  def change
    remove_column :cuts, :x, :integer
    remove_column :cuts, :y, :integer
  end
end
