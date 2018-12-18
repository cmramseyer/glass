class AddOrderActivatedToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_activated, :boolean
    add_column :orders, :activated_date, :datetime
  end
end
