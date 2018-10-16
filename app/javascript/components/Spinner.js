import React from "react"
import PropTypes from "prop-types"
class Spinner extends React.Component {
  render () {
    return (
      <div className="spinner">
        <div className="rect1 bg-primary"></div>
        <div className="rect2 bg-primary"></div>
        <div className="rect3 bg-primary"></div>
        <div className="rect4 bg-primary"></div>
        <div className="rect5 bg-primary"></div>
      </div>
    );
  }
}

export default Spinner
