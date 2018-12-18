class AddLastActivationMessageToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :last_activation_message, :text
  end
end
