import React from 'react';
import BookingSearchContainer from './booking_search_container';
import { Route, Redirect, Switch, Link, HashRouter } from 'react-router-dom';
import BookingContainer from './booking_container';

const App = (props) =>  {
  return (
  <div id="AppElement">
    <Redirect to={'/bookings/'} />
    <BookingSearchContainer/>
    <Route path="/bookings/:bookingId" component={BookingContainer}>
    </Route>
  </div>
);

};



export default App;
