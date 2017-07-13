class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :bl_number
      t.string :ship_line
      t.string :origin
      t.string :destination
      t.string :vessel
      t.string :voyage
      t.string :vessel_eta
      t.timestamps
    end
  end
end
