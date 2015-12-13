import React, { Component } from 'react'
import { Link } from 'react-router'

import PostActions from '../actions/Actions'
import history from '../History'

export default class Post extends Component {
  handleDelete() {
    let postId = this.props.id
    PostActions.delete(postId)
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
