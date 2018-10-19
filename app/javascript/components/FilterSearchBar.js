import React from "react"
import PropTypes from "prop-types"
class FilterSearchBar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      filter: '',
      value: 'title'
    }
  }

  handleChange(e) {
    this.setState({
      filter: e.target.value
    })
    this.props.onFilter(e.target.value)
  }

  handleSelectChange(e) {
    this.setState({
      value: e.target.value
    })
    this.props.onSelect(e.target.value)
  }

  render () {
    return (
      <React.Fragment>
        <div className="form-inline">
          <select value={this.state.value} onChange={this.handleSelectChange.bind(this)} className="custom-select bg-primary text-light">
            <option value="title">Title</option>
            <option value="company">Company</option>
            <option value="location">Location</option>
          </select>
          <input type="text" id="filter"
            value={this.state.filter}
            onChange={this.handleChange.bind(this)}
            placeholder={"Filter by " + this.state.value + ".."}
            className="form-control my-3"/>
        </div>
      </React.Fragment>
    );
  }
}

export default FilterSearchBar
