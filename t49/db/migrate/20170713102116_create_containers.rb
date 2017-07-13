class CreateContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
      t.integer :booking_id, null: false
      t.string :container_id
      t.index :booking_id
      t.index :container_id
      t.string :container_type
      t.string :size
      t.timestamps
    end
  end
end
