import React from 'react';
import $ from 'jquery';
import Condo from './condo.jsx'

export default class CondoList extends React.Component {

  constructor(props) {
    super(props);
    this.state = {searchResults: []};
  }

  componentDidMount() {
    const component = this;
    $.ajax({
      url: "/search.json",
      data: {zip: "60654"}
    }).done(function(data, status, request) {
      console.log(data);
      component.setState({searchResults: data});
    })
  }

  render () {
    return (
      <ul>
        {
          this.state.searchResults.map(
            (result) =>
              <Condo
                key={result.va_condo_id}
                VACondoID={result.va_condo_id}
                name={result.condo_name}
                status={result.status}
                address={result.address}
                coordinates={result.coordinates}
              />
          )
        }
      </ul>
        )
  }
}

