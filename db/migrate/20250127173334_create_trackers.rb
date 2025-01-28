class CreateTrackers < ActiveRecord::Migration[8.0]
  def change
    create_table :trackers do |t|
      t.string :cn

      t.timestamps
    end
  end
end
