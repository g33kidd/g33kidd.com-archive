import React, { Component } from 'react'
import Reflux from 'reflux'
import Post from './Post'

// import PostActions from '../../actions/PostActions'
import PostStore from '../stores/PostStore'

const PostList = React.createClass({
  mixins: [Reflux.connect(PostStore, 'posts')],
  render() {
    let error = "No Posts Found"
    if(this.state.posts) {
      let posts = this.state.posts.map((post) => {
        return <Post key={post.id} id={post.id} attributes={post.attributes} />
      })
      return <div className="post-list">{posts}</div>
    }else{
      return <h1>{error}</h1>
    }
  }
})

export default PostList
