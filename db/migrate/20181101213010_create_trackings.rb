class CreateTrackings < ActiveRecord::Migration[5.0]
  def change
    create_table :trackings do |t|
      t.integer :product_line_id
      t.integer :stage_id
      t.integer :done
      t.integer :next_tracking_id

      t.timestamps
    end
  end
end
