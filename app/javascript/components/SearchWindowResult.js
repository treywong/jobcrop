import React from "react"
import PropTypes from "prop-types"
import Spinner from "./Spinner"
import SearchResultCard from "./SearchResultCard"
import SearchIntro from './SearchIntro'
class SearchWindowResult extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      class: "d-block ml-auto btn font-weight-bold "
    }
  }

  render () {
    let results = this.props.results
    let filteredResults = results.filter(result => result.id == this.props.filterResults)
    if (this.props.filterResults == "") {
      return (
        <div className="results-tab col-8" >
          <SearchIntro intro={this.props.intro} count={this.props.resultsCount}/>
          {this.props.confirmation && <Spinner />}
          <ul className="list-unstyled results-index">
            {results.map(({id, site, cssclass, title, company, location, created_at, image, link}, index) => {
              return (
                <li key={index}>
                  <div id=""className="job-list card my-2 ">
                    <div className="row">
                      <div className="col-2">
                        <div className="card-body">
                          <img src={image} className="d-block mx-auto" style={{width:'55px', height:'55px'}}/>
                          <p className="my-2 border p-1 font-weight-bold reviews text-center small-font">120 <i className="far fa-smile"></i></p>
                        </div>
                      </div>
                      <div className="col-6">
                        <div className="card-body pl-0">
                          <a href="" target="_blank">
                            <h5 className="text-primary card-title mb-1"><strong>{title}</strong></h5>
                          </a>
                          <p className="my-1 small-font">{company}</p>
                          <p className="my-1 text-muted small-font">{location}</p>
                        </div>
                      </div>
                      <div className="col-4">
                        <div className="card-body">
                          <a href={link} target="_blank" className={this.state.class + cssclass}>Apply at {site}</a>
                          <br/>
                          <br/>
                          <p className=" m-0 mt-2 text-center text-muted">{created_at}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
              )
            })}
          </ul>
        </div>
      );
    } else {
      return (
        <div className="results-tab col-8" >
          <SearchIntro intro={this.props.intro}/>
          {this.props.confirmation && <Spinner />}
          <ul className="list-unstyled results-index">
            {filteredResults.map(({id, site, cssclass, title, company, location, created_at, image, link}, index) => {
              return (
                <li key={index}>
                  <div id=""className="job-list card my-2 ">
                    <div className="row">
                      <div className="col-2">
                        <div className="card-body">
                          <img src={image} className="d-block mx-auto" style={{width:'55px', height:'55px'}}/>
                          <p className="my-2 border p-1 font-weight-bold reviews text-center small-font">120 <i className="far fa-smile"></i></p>
                        </div>
                      </div>
                      <div className="col-6">
                        <div className="card-body pl-0">
                          <a href="" target="_blank">
                            <h5 className="text-primary card-title mb-1"><strong>{title}</strong></h5>
                          </a>
                          <p className="my-1 small-font">{company}</p>
                          <p className="my-1 text-muted small-font">{location}</p>
                        </div>
                      </div>
                      <div className="col-4">
                        <div className="card-body">
                          <a href={link} target="_blank" className={this.state.class + cssclass}>Apply at {site}</a>
                          <br/>
                          <br/>
                          <p className=" m-0 mt-2 text-center text-muted">{created_at}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
              )
            })}
          </ul>
        </div>
      );
    }
  }
}

export default SearchWindowResult
