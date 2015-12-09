import React, { Component } from 'react'
import Post from './Post'

export default class PostList extends Component {
  render() {
    let posts = this.props.data.map((post) => {
      return <Post key={post.id} title={post.title} body={post.body} />
    })

    return <div className="post-list">{posts}</div>
  }
}
