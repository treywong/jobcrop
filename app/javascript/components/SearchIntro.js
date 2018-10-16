import React from "react"
import PropTypes from "prop-types"
class SearchIntro extends React.Component {
  render () {
    if(this.props.intro == 1) {
      return (
        <React.Fragment>
          <div className="card search-intro">
            <div className="card-body">
              <p className="m-0 text-secondary">Hello! Start hunting by inputting your query!</p>
            </div>
          </div>
        </React.Fragment>
      )
    } else if(this.props.intro == 2) {
      return (
        <React.Fragment>
          <div className="card search-intro">
            <div className="card-body">
              <p className="m-0 text-secondary">Hunting... </p>
            </div>
          </div>
        </React.Fragment>
      )
    } else {
      return (
        <React.Fragment>
          <div className="card search-intro">
            <div className="card-body">
              <p className="m-0 text-secondary">Aha! Here are the results. {this.props.count} results found.</p>
            </div>
          </div>
        </React.Fragment>
      )
    }
  }
}

export default SearchIntro
