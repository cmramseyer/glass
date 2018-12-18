class AddPrevTrackingToTracking < ActiveRecord::Migration[5.0]
  def change
    add_column :trackings, :prev_tracking_id, :integer
  end
end
