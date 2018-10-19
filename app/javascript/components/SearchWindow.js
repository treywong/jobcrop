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
      fResults: [],
      resultsIndex: '',
      searchTag: [],
      confirmation: '',
      intro: 1,
      filter: '',
      searchFilter: '',
      select: 'title'
    }
  }

  componentWillMount() {
    this.setState({
      fResults: this.state.results
    })
  }

  handleSearch(data) {
    var r = this.state.results.slice();
    r.push(data)
    this.setState({
      results: r,
      fResults: r
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
        fResults: [],
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

  handleSearchFilter(search) {
    let fResults = this.state.results.flat(2)
    let selectFilter = this.state.select
    if (selectFilter == "title") {
      fResults = fResults.filter((result) => {
        let resultTitle = result.title.toLowerCase()
        return resultTitle.indexOf(
          search.toLowerCase()) !== -1
        })
        this.setState({
          fResults
        })
    } else if (selectFilter == "company") {
      fResults = fResults.filter((result) => {
      let resultTitle = result.company.toLowerCase()
      return resultTitle.indexOf(
        search.toLowerCase()) !== -1
      })
      this.setState({
        fResults
      })
    } else if (selectFilter == "location") {
      fResults = fResults.filter((result) => {
      let resultTitle = result.location.toLowerCase()
      return resultTitle.indexOf(
        search.toLowerCase()) !== -1
      })
      this.setState({
        fResults
      })
    }
  }

  handleSelect(select) {
    this.setState({
      select: select
    })
  }

  render () {
    let results = this.state.results
    let count = results.flat().length
    console.log(this.state.fResults)
    return (
      <div className="search-window card shadow border-0">
        <h4 className="py-3 bg-primary text-center font-weight-bold text-light">Hunt Engine <span className="medium-font font-weight-normal">Powered by <i className="fab fa-react"></i></span></h4>
        <div className="search-window-body card-body">
          <HuntEngine onSearch={this.handleSearch.bind(this)} onConfirmation={this.handleConfirmation.bind(this)} onIntro={this.handleIntro.bind(this)} onSearchTag={this.handleSearchTag.bind(this)}/>
          <div className="row h-100">
            <SearchWindowFilter onFilter={this.handleFilter.bind(this)}
                                searchTags={this.state.searchTag}
                                onRemoveSearch={this.handleRemoveSearch.bind(this)}
                                onSingleDrop={this.handleSingleDrop.bind(this)}
                                onSearchFilter={this.handleSearchFilter.bind(this)}
                                onSelect={this.handleSelect.bind(this)}/>
            <SearchWindowResult results={this.state.results}
                                resultsCount={count}
                                confirmation={this.state.confirmation}
                                intro={this.state.intro}
                                filterResults={this.state.filter}
                                fResults={this.state.fResults}/>
          </div>
        </div>
      </div>
    );
  }
}

export default SearchWindow
