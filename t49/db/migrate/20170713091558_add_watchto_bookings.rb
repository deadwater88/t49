class AddWatchtoBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :watch, :boolean, default: false
  end
end
