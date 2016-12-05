class Coordinates extends React.Component {
  constructor(props) {
    super(props);
    this.style = {
      marginLeft: '10px',
    };
  }
  render () {
    return (
      <div style={this.style}>
        <div>Latitude: {this.props.latitude}</div>
        <div>Longitude: {this.props.longitude}</div>
      </div>
    );
  }
}

Coordinates.propTypes = {
  latitude: React.PropTypes.string,
  longitude: React.PropTypes.string
};
