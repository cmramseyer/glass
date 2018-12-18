class AddObjectToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :object_id, :integer
    add_column :activities, :object_type, :string
    add_column :activities, :action, :string
    add_column :activities, :quantity, :integer
  end
end
