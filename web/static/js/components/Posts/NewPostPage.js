import React, { Component } from 'react'
// import 'simplemde/src/css/simplemde.css'
// import editor from '../../editor'

import MarkdownEditor from '../Editor/MarkdownEditor'

const PostForm = React.createClass({
  getInitialState() {
    return {
      title: "",
      body: "# Some Markdown \n *A* markdown editor..."
    }
  },

  updateBody(newBody) {
    this.setState({
      body: newBody
    })
  },

  render() {
    return (
      <div className="post-form">
        <div>
          <input type="text" className="input title" value={this.state.title} />
        </div>
        <div>
          <input type="text" className="input slug" />
        </div>
        <div>
          <MarkdownEditor value={this.state.body} onChange={this.updateBody} />
        </div>
      </div>
    )
  },

  _handleChange() {
    console.log("changed!")
  }
})

export default class NewPostPage extends Component {
  render() {
    return (
      <div>
        <h1>New Post!</h1>
        <PostForm />
      </div>
    )
  }
}
