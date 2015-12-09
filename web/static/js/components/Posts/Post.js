import React, { Component } from 'react'

export default class Post extends Component {
  render() {
    return (
      <div className="post">
        <div className="title">{this.props.title}</div>
        <div className="body">{this.props.body}</div>
      </div>
    )
  }
}
