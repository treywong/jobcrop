import React from "react"
import PropTypes from "prop-types"
class FilterSearchBar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      filter: ''
    }
  }

  handleChange(e) {
    this.setState({
      filter: e.target.value
    })
    this.props.onFilter(e.target.value)
  }

  render () {
    return (
      <React.Fragment>
        <div>
          <input type="text" id="filter"
            value={this.state.filter}
            onChange={this.handleChange.bind(this)}
            placeHolder="Filter by Title.."
            className="form-control my-3"/>
        </div>
      </React.Fragment>
    );
  }
}

export default FilterSearchBar
