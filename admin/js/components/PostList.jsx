import _ from 'lodash'
import React, { Component } from 'react'
import Reflux, { ListenerMixin } from 'reflux'
import Post from './Post'

import PostActions from '../actions/PostActions'
import PostStore from '../stores/PostStore'

const PostList = React.createClass({
  mixins: [ListenerMixin],

  getInitialState() {
    return {
      loading: !PostStore.loaded,
      posts: PostStore.getInitialState()
    }
  },

  onPostsChange(posts) {
    this.setState({
      loading: false,
      posts: posts
    })
  },

  componentDidMount() {
    this.listenTo(PostStore, this.onPostsChange)
    if(!PostStore.loaded) PostActions.load()
  },

  render() {
    if(this.state.loading)
      return <p>Loading Posts...</p>

    let posts = _.map(this.state.posts, (post) => {
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
