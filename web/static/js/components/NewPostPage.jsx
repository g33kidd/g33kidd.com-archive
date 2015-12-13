import React, { Component } from 'react'
import MDEditor from './MDEditor'

const PostForm = React.createClass({
  getInitialState() {
    return { title: "", slug: "" }
  },

  updateBody(newBody) {
    this.setState({ body: newBody })
  },

  slugifyString(string) {
    return string.toString().toLowerCase()
      .replace(/\s+/g, '-')
      .replace(/[^\w\-]+/g, '')
      .replace(/\-\-+/g, '-')
      .replace(/^-+/, '')
      .replace(/-+$/, '')
  },

  updateSlug(newSlug) {
    let slug = this.slugifyString(newSlug);
    console.log(slug)
    this.setState({ slug: slug })
  },

  handleTitleChange(e) {
    console.log(e.target.value)

    this.updateSlug(e.target.value)
  },

  render() {
    return (
      <div className="post-form">
        <div>
          <input type="text" className="input title" onChange={this.handleTitleChange} />
        </div>
        <div>
          <input type="text" maxLength="20" className="input slug" value={this.state.slug} />
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
