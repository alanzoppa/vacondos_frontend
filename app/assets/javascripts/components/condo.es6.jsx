class Condo extends React.Component {
  constructor(props) {
    super(props);
    this.style = {
      marginBottom: '10px',
    };
  }
  render () {
    return (
      <div style={this.style}>
        <div>Condo Name: {this.props.name}</div>
        <div>Condo Status: {this.props.status}</div>
        <div>Va Condo ID: {this.props.VACondoID}</div>
        <Address
          line1={this.props.address.line1}
          line2={this.props.address.line2}
          city={this.props.address.city}
          state={this.props.address.state}
          zip={this.props.address.zip}
          country={this.props.address.country}
        />
        <Coordinates
          latitude={this.props.coordinates.latitude}
          longitude={this.props.coordinates.longitude}
        />
      </div>
    );
  }
}

Condo.propTypes = {
  condoName: React.PropTypes.string,
  condoStatus: React.PropTypes.string,
  vaCondoId: React.PropTypes.string,
  //address: React.PropTypes.instanceOf(Address)
};
