class CreateRoas < ActiveRecord::Migration[8.0]
  def change
    create_table :roas do |t|
      t.integer :lroa
      t.string :old_roa
      t.string :roa_top
      t.string :status
      t.references :tracker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
