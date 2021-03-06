import React from 'react';
import { browserHistory } from 'react-router';


class BookingSearch extends React.Component {
  constructor(props){
    super(props);
    this.state = {input: "", loader: false, message: ""};
    this.updateInput = this.updateInput.bind(this);
    this.submitSearch = this.submitSearch.bind(this);
  }

  updateInput(e) {
    e.preventDefault();
    this.setState({input: e.currentTarget.value});
  }

  submitSearch(e){
    e.preventDefault();
    this.setState({loader: true});
    let query = this.state.input;
    this.props.fetchBooking(query).then(()=>{
      console.log("test");
      let test;
      this.props.history.push(`/bookings/${query}`);
      this.setState({message: 'Booking Found!'});
    },()=>{
      this.setState({message: `"${query}"  Invalid Booking Number or Booking Number Not Found'`});
    }).always(()=>{
      this.setState({loader: false});
    });

  }


  render() {
    return (
      <div>
        <header className='light-bluebg'>
          <div className="search-Container">
            <h2 className='white-text' > Terminal 49 </h2>
            <form>
              <label className='white-text'>
                Search by Booking Number:
                <input onChange={this.updateInput} placeholder={'ex PABVTXG790195200'} value={this.state.input}>
                </input>
              </label>
            <div className="button-Container">
              <button onClick={this.submitSearch.bind(this)} className='search button'>
                Search
              </button>
              {this.state.loader ? <div className="loader bksearch">Loading...</div> : <div className='message'> {this.state.message} </div>}
            </div>
          </form>
          </div>
        </header>
      </div>
    );
  }
}

export default BookingSearch;
