json.extract!(@booking,
              :bl_number,
              :ship_line,
              :origin,
              :destination,
              :vessel,
              :voyage,
              :vessel_eta,
              :watch
)



json.set! :containers do
  json.array! @booking.containers do |container|
    json.extract!(container, :size, :container_type, :container_id)
  end
end
