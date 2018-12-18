class RemoveColumnMessageFromActivity < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :message, :text
  end
end
