class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end
end
