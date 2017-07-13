import * as BookingAPIUtil from "../utils/booking_api_utils";

export const RECEIVE_BOOKING = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const CLEAR_ERRORS = 'CLEAR_ERRORS';

export const fetchBooking = (booking_id) => dispatch => {
  return BookingAPIUtil.fetchBooking(booking_id).then(
    res => {
      dispatch(receiveBooking(res));
    },
    err => dispatch(receiveErrors(err.responseJSON))

  );

};

const receiveBooking = booking => ({
  type: RECEIVE_BOOKING,
  booking
});

const receiveErrors = errors => ({
  type: RECEIVE_ERRORS,
  errors
});

export const clearErrors = () => ({
  type: CLEAR_ERRORS
});
