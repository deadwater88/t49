import React from 'react';

class BookingSearch extends React.Component {
  constructor(props){
    super(props);
    this.state = {input: ""};
    this.updateInput = this.updateInput.bind(this);
  }

  updateInput(e) {
    e.preventDefault();
    this.setState({input: e.currentTarget.value});
  }

  fetchBooking(e){
    e.preventDefault();
  }


  render() {

    return (
      <div>
        <header>
          T49 Project

          <form>
            <label>
              Search by Booking Number:
              <input onChange={this.updateInput} placeholder={'ex PABVTXG790195200'} value={this.state.input}>

              </input>
            </label>
          </form>
          <button className='search button'>
            Search
          </button>
        </header>

      </div>
    );
  }
}

export default BookingSearch;
