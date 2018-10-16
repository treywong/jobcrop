import React from "react"
import PropTypes from "prop-types"
class SearchWindowFilter extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      filter: ''
    }
  }

  handleChange(e) {
    this.props.onFilter(e.target.value)
  }

  render () {
    return (
      <div className="col-4" >
        <div className="card my-2 bg-primary text-white">
          <div className="card-body">
            <h5 className="card-title font-weight-bold">Filter Result</h5>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_all" value="" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label" htmlFor="search_filter_all">All</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_jc" value="jc" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label" htmlFor="search_filter_jc">JobCrop</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_fj" value="fj" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label" htmlFor="search_filter_fj">Fastjob</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_gd" value="gd" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label" htmlFor="search_filter_gd">Glassdoor</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_i" value="i" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label" htmlFor="search_filter_i">Indeed</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_js" value="js" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label" htmlFor="search_filter_js">Jobstreet</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_jstore" value="jstore" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label" htmlFor="search_filter_jstore">Jobstore</label>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default SearchWindowFilter
