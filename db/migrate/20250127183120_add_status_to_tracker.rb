class AddStatusToTracker < ActiveRecord::Migration[8.0]
  def change
    add_column :trackers, :active, :boolean
  end
end
