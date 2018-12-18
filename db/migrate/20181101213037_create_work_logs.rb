class CreateWorkLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :work_logs do |t|
      t.integer :tracking_id
      t.integer :user_id

      t.timestamps
    end
  end
end
