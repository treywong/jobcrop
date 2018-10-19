import React from "react"
import PropTypes from "prop-types"
class SearchWindowTags extends React.Component {
  constructor(props) {
    super(props)
    this.handleSingleDrop = this.handleSingleDrop.bind(this)
    this.state = {
      removeSearch: false,
      removeSingleTag: false
    }
  }

  handleClick(e) {
    e.preventDefault()
    this.setState({
      removeSearch: true
    })
    this.props.onRemoveSearch(this.state.removeSearch)
  }

  handleSingleDrop(e) {
    e.preventDefault()
    let target = e.target
    let tagName = target.parentElement.parentElement.innerHTML
    let arrayTagName = tagName.split('')
    let a = arrayTagName.indexOf('<')
    let parsedTagName = arrayTagName.slice(0, a)
    parsedTagName.pop()
    let b = parsedTagName.join('')
    this.props.onSingleDrop(b)
  }

  render () {
    let searchTags = this.props.searchTags
    return (
      <div className="card my-2 border-0">
        <div className="card-body">
          <p className="text-muted card-title">Searches
            {searchTags != '' && <a href='#' onClick={this.handleClick.bind(this)} className="medium-font"> Clear Search</a>}</p>
            <div className="d-flex flex-row flex-wrap">
              {searchTags.map((tag, index) => {
                return (
                  <div key={index} className='badge-secondary m-1'>
                    <p className='m-0 p-2'>{tag} <a href='#' onClick={this.handleSingleDrop.bind(this)}><i className="fas fa-times"></i></a></p>
                  </div>
                )
              })}
            </div>
        </div>
      </div>
    );
  }
}

export default SearchWindowTags
