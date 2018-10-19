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
      resultsIndex: '',
      searchTag: [],
      confirmation: '',
      intro: 1,
      filter: ''
    }
  }

  handleSearch(data) {
    var r = this.state.results.slice();
    r.push(data)
    this.setState({
      results: r
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

  handleSearchTag(s) {
    var st = this.state.searchTag
    st.push(s)
    this.setState({
      searchTag: st
    })
  }

  handleRemoveSearch(bool) {
    if(bool === true){
      this.setState({
        results: [],
        searchTag: []
      })
    }
  }

  handleSingleDrop(tag) {
    let r = this.state.results
    let s = this.state.searchTag
    let index = s.indexOf(tag)
    r.splice(index, 1)
    s.splice(index, 1)
    r.flat(2)
    this.setState({
      results: r,
      searchTag: s
    })
  }

  render () {
    let results = this.state.results
    let count = results.flat().length
    console.log(results)
    return (
      <div className="search-window card shadow border-0">
        <h4 className="py-3 bg-primary text-center font-weight-bold text-light">Hunt Engine <span className="medium-font font-weight-normal">Powered by <i className="fab fa-react"></i></span></h4>
        <div className="search-window-body card-body">
          <HuntEngine onSearch={this.handleSearch.bind(this)} onConfirmation={this.handleConfirmation.bind(this)} onIntro={this.handleIntro.bind(this)} onSearchTag={this.handleSearchTag.bind(this)}/>
          <div className="row h-100">
            <SearchWindowFilter onFilter={this.handleFilter.bind(this)}
                                searchTags={this.state.searchTag}
                                onRemoveSearch={this.handleRemoveSearch.bind(this)}
                                onSingleDrop={this.handleSingleDrop.bind(this)}/>
                              <SearchWindowResult results={this.state.results} resultsCount={count} confirmation={this.state.confirmation} intro={this.state.intro} filterResults={this.state.filter}/>
          </div>
        </div>
      </div>
    );
  }
}

export default SearchWindow
