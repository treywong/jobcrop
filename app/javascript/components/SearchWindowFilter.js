import React from "react"
import PropTypes from "prop-types"
import SearchWindowTags from "./SearchWindowTags"
import FilterSearchBar from "./FilterSearchBar"
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

  handleFilter(search) {
    this.props.onSearchFilter(search)
  }

  handleSelect(select) {
    this.props.onSelect(select)
  }

  render () {
    return (
      <div className="col-4" >
        <div className="card mb-4 border-0 bg-light">
          <div className="card-body">
            <h5 className="card-title font-weight-bold text-dark">Filter Result</h5>
            <FilterSearchBar onFilter={this.handleFilter.bind(this)} onSelect={this.handleSelect.bind(this)}/>
            <p className="m-0 text-dark font-weight-bold">Filter by Site: </p>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_all" value="" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label text-dark" htmlFor="search_filter_all">All</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_jc" value="jc" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label text-dark" htmlFor="search_filter_jc">JobCrop</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_fj" value="fj" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label text-dark" htmlFor="search_filter_fj">Fastjob</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_gd" value="gd" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label text-dark" htmlFor="search_filter_gd">Glassdoor</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_i" value="i" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label text-dark" htmlFor="search_filter_i">Indeed</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_js" value="js" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label text-dark" htmlFor="search_filter_js">Jobstreet</label>
            </div>
            <div className="form-check">
              <input className="form-check-input" type="radio" name="search[filter]" id="search_filter_jstore" value="jstore" onChange={this.handleChange.bind(this)}/>
              <label className="form-check-label text-dark" htmlFor="search_filter_jstore">Jobstore</label>
            </div>
          </div>
        </div>
        <SearchWindowTags searchTags={this.props.searchTags}
                          onRemoveSearch={this.props.onRemoveSearch}
                          onSingleDrop={this.props.onSingleDrop}/>
      </div>
    );
  }
}

export default SearchWindowFilter
