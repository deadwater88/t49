import React from 'react';
import Container from './container';


class Booking extends React.Component {
  constructor(props){
    super(props);
    this.toggleWatchBooking = this.toggleWatchBooking.bind(this);
    this.state = {loader: false};
  }

  componentWillReceiveProps(newprops){
    let bookingId = newprops.match.params.bookingId;
    if (bookingId !== this.props.booking.bl_number){
      this.props.fetchBooking(bookingId);
    }

  }

  componentWillMount(){
    let bookingId = this.props.match.params.bookingId;
    this.props.fetchBooking(bookingId);
  }

  renderWatchButton(){
    let watch = this.props.booking.watch;
    return (
    <div className="watch-button-container">
      <button onClick={this.toggleWatchBooking}>
        {watch ? 'Stop Watching' : 'Watch'}
      </button>
      {this.state.loader ? <div className="loader bkitem">Loading...</div> : <div className='message'> {this.state.message} </div>}
    </div>
    );
  }

  toggleWatchBooking(e){
    e.preventDefault();
    this.setState({loader: true});
    this.props.watchBooking(this.props.booking.bl_number).then(()=>{
      let message = this.props.booking.watch ? 'We are now tracking this Booking' : 'We are no longer tracking this booking';
      this.setState({message});
    },()=>{
      this.setState({message: 'Failed to Watch booking'});
    }).always(()=>{
      this.setState({loader: false});
    });
  }

  render() {
    let {bl_number, destination, vessel, ship_line, origin, vessel_eta, voyage, containers} = this.props.booking;
    containers = containers || [];
    let bookingDisplay = [
      {label: 'B/L Number', value: bl_number},
      {label: 'Steamship Line', value: ship_line},
      {label: 'Origin', value: origin},
      {label: 'Destination', value: destination},
      {label: 'Vessel', value: vessel},
      {label: 'Voyage', value: voyage},
      {label: 'Vessel ETA', value: vessel_eta},
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
        {containers.map((containerProp, idx)=>{
          return <Container container={containerProp} key={idx + 'container'}/>;
        })}
        {bl_number ? this.renderWatchButton() : ""}

      </div>
    );
  }
}

export default Booking;
