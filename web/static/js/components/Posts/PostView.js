import React from 'react'
import PostList from './PostList'

import PostStore from '../../stores/PostStore'

const PostView = React.createClass({
  getInitialState() {
    return PostStore.getList()
  },

  componentDidMount() {
    PostStore.addChangeListener(this._onChange)
  },

  componentWillUnmount() {
    PostStore.removeChangeListener(this._onChange)
  },

  _onChange() {
    this.setState(PostStore.getList())
  },

  render() {
    return (
      <div className="post-view">
        <PostList list={this.state.list} />
      </div>
    )
  }
})

export default PostView
