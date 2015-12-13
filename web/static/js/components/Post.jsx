import React, { Component } from 'react'
import { Link } from 'react-router'

import history from '../History'

export default class Post extends Component {
  handleDelete() {
    console.log(`delete post: ${this.props.id}`)
  }

  handleClickPost() {
    console.log(this.props)
    let postUrl = `/${this.props.attributes.slug}`
    window.open(postUrl, '_blank')
  }

  render() {
    return (
      <div className="post">
        <div className="top">
          <div className="edit">
            <Link to={`/posts/${this.props.id}`}>Edit</Link>
          </div>
          <div className="title">{this.props.attributes.title}</div>
          <div className="actions">
            <button className="delete" onClick={() => this.handleDelete()}>
              Delete
            </button>
            <button className="view" onClick={() => this.handleClickPost()}>
              View
            </button>
          </div>
        </div>
      </div>
    )
  }
}
