import { RECEIVE_BOOKING, RECEIVE_ERRORS, CLEAR_ERRORS } from '../actions/booking_actions';
const initialState = {
  errors: []
};

const BookingReducer = (state = initialState, action) => {
  Object.freeze(state);
  const newState = merge({},state);
  switch (action.type) {
    case RECEIVE_BOOKING:
      return {
        booking: action.booking,
        errors: []
      };
    case RECEIVE_ERRORS:
      newState.errors = action.errors;
      return newState;
    case CLEAR_ERRORS:
      newState.errors = [];
      return newState;
    default:
      return state;
  }
};

export default BookingReducer;
