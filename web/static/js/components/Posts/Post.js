import React, { Component } from 'react'
import { Link } from 'react-router'

export default class Post extends Component {
  render() {
    return (
      <div className="post">
        <Link to={`/posts/${this.props.id}`}>Edit Post</Link>
        <div className="title">{this.props.attributes.title}</div>
        <div className="body">{this.props.attributes.body}</div>
      </div>
    )
  }
}
