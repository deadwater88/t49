
export const fetchBooking = (booking_id) => {
  return $.ajax({
    method: "GET",
    url: `bookings/${booking_id}`
  });
};

export const watchBooking = (booking_id) => {
  return $.ajax({
    method: "PATCH",
    url: `bookings/${booking_id}`
  });
};
