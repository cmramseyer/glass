class AddColumnStatusToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :status, :integer, default: 0
    remove_column :orders, :order_activated, :boolean
  end
end
