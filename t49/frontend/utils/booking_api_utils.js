
export const fetchBooking = (booking_id) => {
  return $.ajax({
    method: "GET",
    url: `bookings/${booking_id}`
  });
};
