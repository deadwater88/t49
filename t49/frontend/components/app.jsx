import React from 'react';
import BookingSearchContainer from './booking_search_container';
import { Route, Redirect, Switch, Link, HashRouter } from 'react-router-dom';
import BookingContainer from './booking_container';

const App = (props) =>  {
  return (
  <div id="AppElement">
    <BookingSearchContainer/>
    <Switch>
      <Route path="/bookings/:bookingId" component={BookingContainer}>
      </Route>
      <Redirect from="/" to='/bookings/' />
    </Switch>
  </div>
);

};



export default App;
