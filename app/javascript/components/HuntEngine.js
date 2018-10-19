import React from "react"
import PropTypes from "prop-types"
class HuntEngine extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      search: "",
      results: [],
      intro: 1
    }
  }
  componentDidMount() {
    document.getElementById("search_result").onkeypress = (event) => {
      var key = event.charCode || event.keyCode || 0;
      if (key == 13) {
        event.preventDefault();
        this.setState({
          fetchInProgress: true,
          intro: 2
        })

        this.props.onConfirmation(this.state.fetchInProgress)
        this.props.onIntro(this.state.intro)
        this.props.onSearchTag(this.state.search)
        $.ajax({
          url: "/search",
          method: 'POST',
          data: {
            authenticity_token: $('[name="csrf-token"]')[0].content,
            search: {result: this.state.search}
          },
          success: (data) => {
              this.props.onSearch(data)
              this.setState({
                fetchInProgress: false,
                intro: 3
              })

              this.props.onConfirmation(this.state.fetchInProgress)
              this.props.onIntro(this.state.intro)
          }
        })
      }
    }
  }

  handleChange(e) {
    var input = e.target.value
    this.setState({
      search: input
    })
  }

  render () {
    return (
      <React.Fragment>
        <form className="form-inline">
          <div className="input-group w-100">
              <input type="text"
                     className="border-0 bg-searchbar py-2 mb-3 w-100"
                     placeholder="Hunt a Job..."
                     id="search_result"
                     value={this.state.search}
                     onChange={this.handleChange.bind(this)}
              />
          </div>
        </form>
      </React.Fragment>
    );
  }
}

export default HuntEngine
