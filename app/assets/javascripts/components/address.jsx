import React from 'react';

export default class Address extends React.Component { 
  constructor(props) {
    super(props);
    this.style = {
      marginLeft: '10px',
    };
  }
  render () {
    return (
        <div style={this.style}>
          <div>Line1: {this.props.line1}</div>
          <div>Line2: {this.props.line2}</div>
          <div>City: {this.props.city}</div>
          <div>State: {this.props.state}</div>
          <div>Zip: {this.props.zip}</div>
          <div>Country: {this.props.country}</div>
        </div>
        );
  }
}

Address.propTypes = {
  line1: React.PropTypes.string,
  line2: React.PropTypes.string,
  city: React.PropTypes.string,
  state: React.PropTypes.string,
  zip: React.PropTypes.string,
  country: React.PropTypes.string
};
