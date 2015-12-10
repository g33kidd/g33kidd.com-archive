import React, { Component } from 'react'
// import 'simplemde/src/css/simplemde.css'
// import editor from '../../editor'

import MarkdownEditor from '../Editor/MarkdownEditor'
import MDEditor from '../Editor/MDEditor'

const PostForm = React.createClass({
  getInitialState() {
    return { title: "", slug: "" }
  },

  updateBody(newBody) {
    this.setState({ body: newBody })
  },

  updateSlug(newSlug) {
    this.setState({ slug: newSlug })
  },

  render() {
    return (
      <div className="post-form">
        <div>
          <input type="text" className="input title" />
        </div>
        <div>
          <input type="text" className="input slug" />
        </div>
        <div>
          <MDEditor />
        </div>
      </div>
    )
  }
})

export default class NewPostPage extends Component {
  render() {
    return (
      <div>
        <h2>Create a Post</h2>
        <PostForm />
      </div>
    )
  }
}
