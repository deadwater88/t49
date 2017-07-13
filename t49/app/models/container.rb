class Container < ApplicationRecord

  belongs_to :booking,
    foreign_key: :booking_id,
    class_name: :Booking
end
