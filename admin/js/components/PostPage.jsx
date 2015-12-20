import React from 'react'
import PostList from './PostList'

export default class PostPage extends React.Component {
  render() {
    return (
      <div className="post-page">
        <PostList />
      </div>
    )
  }
}
