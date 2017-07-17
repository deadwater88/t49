import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';
import { fetchBooking } from '../actions/booking_actions';

import BookingSearch from './booking_search';


const mapStateToProps = (state) =>({
  booking: state.booking
});

const mapDispatchToProps = (dispatch) => ({
  fetchBooking: (booking_id) => dispatch(fetchBooking(booking_id))
});

export default withRouter(connect(mapStateToProps,
               mapDispatchToProps)(BookingSearch));
