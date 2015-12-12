import React, { Component } from 'react'
import Post from './Post'

import PostActions from '../../actions/PostActions'

export default class PostList extends Component {
  componentDidMount() {
    PostActions.getPosts()
  }

  render() {
    let posts = this.props.list.map((post) => {
      return <Post key={post.id} id={post.id} attributes={post.attributes} />
    })

    return <div className="post-list">{posts}</div>
  }
}
