import { connect } from 'react-redux';
import { watchBooking, fetchBooking } from '../actions/booking_actions';
import Booking from './booking';


const mapStateToProps = (state) =>({
  booking: state.booking
});
const mapDispatchToProps = (dispatch) => ({
   watchBooking: (booking_id) => dispatch(watchBooking(booking_id)),
   fetchBooking: (booking_id) => dispatch(fetchBooking(booking_id))
});

export default connect(mapStateToProps,
               mapDispatchToProps)(Booking);
