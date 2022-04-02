class OrdersProgress < ApplicationRecord
  self.table_name = 'orders_progresses'

  enum status: [:created, :activated, :finished]

  def readonly?
    true
  end
end