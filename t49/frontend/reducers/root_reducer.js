import { combineReducers } from 'redux';
import BookingReducer from './booking_reducer';


const appReducer = combineReducers({
  booking: BookingReducer
});


const rootReducer = (state, action) => {
  if (action.type === 'LOGOUT') {
    state = undefined;
  }

  return appReducer(state, action);
};

export default rootReducer;
