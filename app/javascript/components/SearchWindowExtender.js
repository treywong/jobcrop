import React from "react"
import PropTypes from "prop-types"
class SearchWindowExtender extends React.Component {
  handleClick(){
    $('.search-window').addClass('visible');
    $('.backdrop').show();
  }

  render () {
    return (
      <React.Fragment>
        <button id="trigger_search" className="btn btn-outline-secondary w-100" onClick={this.handleClick}>Access Hunt Engine</button>
      </React.Fragment>
    );
  }
}

export default SearchWindowExtender
