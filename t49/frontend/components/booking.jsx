import React from 'react';

class Booking extends React.Component {
  constructor(props){
    super(props);
  }

  render() {
    let {bl_number, destination, vessel, ship_line, origin, vessel_eta, voyage} = this.props.booking;
    let bookingDisplay = [
      {label: 'B/L Number', value: bl_number},
      {label: 'Steamship Line', value: ship_line},
      {label: 'Origin', value: origin},
      {label: 'Destination', value: destination},
      {label: 'Vessel', value: vessel},
      {label: 'Voyage', value: voyage},
      {label: 'Vessel ETA', value: vessel_eta}
    ];
    return (
      <div className= 'booking-display'>
        {bookingDisplay.map((display, idx)=> {
          return (
          <div className='display' key={idx + 'display'}>
            <label >
              {display.label + ':'}
            </label>
            <p> {display.value} </p>
          </div>
        );
        })}
      </div>
    );
  }
}

export default Booking;
