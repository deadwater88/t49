import { connect } from 'react-redux';
import { watchBooking, fetchBooking } from '../actions/booking_actions';
import Booking from './booking';
import { withRouter } from 'react-router-dom';


const mapStateToProps = (state) =>({
  booking: state.booking
});
const mapDispatchToProps = (dispatch) => ({
   watchBooking: (booking_id) => dispatch(watchBooking(booking_id)),
   fetchBooking: (booking_id) => dispatch(fetchBooking(booking_id))
});

export default withRouter(connect(mapStateToProps,
               mapDispatchToProps)(Booking));
