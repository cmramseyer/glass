class AddQuantityToWorkLog < ActiveRecord::Migration[5.0]
  def change
    add_column :work_logs, :quantity, :integer
  end
end
