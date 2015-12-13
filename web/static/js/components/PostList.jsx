import React, { Component } from 'react'
import Reflux, { ListenerMixin } from 'reflux'
import Post from './Post'
import { map } from 'lodash'

import PostActions from '../actions/Actions'
import PostStore from '../stores/PostStore'

const PostList = React.createClass({
  mixins: [ListenerMixin],

  getInitialState() {
    return {
      loading: !PostStore.loaded,
      posts: PostStore.getInitialState()
    }
  },

  componentDidMount() {
    this.listenTo(PostStore, this.handleLoadPostsComplete)
    if(!PostStore.loaded) PostActions.load()
  },

  handleLoadPostsComplete(posts) {
    this.setState({
      loading: false,
      posts: posts
    })
  },

  render() {

    if(this.state.loading)
      return <p>Loading Posts...</p>

    let posts = map(this.state.posts, (post) => {
      return <Post key={post.id} id={post.id} attributes={post.attributes} />
    })

    return (
      <div className="post-list">
        {posts}
      </div>
    )
  }
})

export default PostList
