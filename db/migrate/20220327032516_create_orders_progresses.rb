class CreateOrdersProgresses < ActiveRecord::Migration[5.2]
  def change
    create_view :orders_progresses
  end
end
