
export const fetchBooking = (booking_id) => {
  return $.ajax({
    method: "GET",
    url: `booking/${booking_id}`
  });
};
