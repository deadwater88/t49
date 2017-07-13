import React from 'react';
import BookingSearchContainer from './booking_search_container';
import BookingContainer from './booking_container';

const App = (props) =>  {
  return (
  <div id="AppElement">
    <BookingSearchContainer/>
    <BookingContainer/>
  </div>
);

};



export default App;
