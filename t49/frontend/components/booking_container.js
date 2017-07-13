import { connect } from 'react-redux';

import Booking from './booking';


const mapStateToProps = (state) =>({
  booking: state.booking
});


export default connect(mapStateToProps,
               null)(Booking);
