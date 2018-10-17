import React from "react"
import PropTypes from "prop-types"
import SearchWindowFilter from "./SearchWindowFilter";
import SearchWindowResult from "./SearchWindowResult";
import HuntEngine from "./HuntEngine";
class SearchWindow extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      results: [],
      confirmation: '',
      intro: 1,
      filter: ''
    }
  }

  handleSearch(data) {
    this.setState({
      results: data.flat()
    })
  }

  handleConfirmation(bool) {
    this.setState({
      confirmation: bool
    })
  }

  handleIntro(int) {
    this.setState({
      intro: int
    })
  }

  handleFilter(f) {
    this.setState({
      filter: f
    })
  }

  render () {
    return (
      <div className="search-window card shadow p-2">
        <div className="search-window-body card-body">
          <h4 className="text-center font-weight-bold">Hunt Engine <span className="medium-font font-weight-normal">Powered by <i class="fab fa-react"></i></span></h4>
          <HuntEngine onSearch={this.handleSearch.bind(this)} onConfirmation={this.handleConfirmation.bind(this)} onIntro={this.handleIntro.bind(this)}/>
          <div className="row h-100">
            <SearchWindowFilter onFilter={this.handleFilter.bind(this)}/>
            <SearchWindowResult results={this.state.results} resultsCount={this.state.results.length} confirmation={this.state.confirmation} intro={this.state.intro} filterResults={this.state.filter}/>
          </div>
        </div>
      </div>
    );
  }
}

export default SearchWindow
