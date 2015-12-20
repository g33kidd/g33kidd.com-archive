import React, { Component } from 'react'
import Reflux, { ListenerMixin } from 'reflux'

import PostActions from '../actions/PostActions'
import PostStore from '../stores/PostStore'

const PostEditPage = React.createClass({
  mixins: [ListenerMixin],
  editor: null,

  getInitialState() {
    const postId = this.props.params.id
    const post = PostStore.getInitialState().posts
    return {
      loading: !PostStore.get(this.props.params.id),
      posts: post
    }
  },

  componentWillMount() {
    this.listenTo(PostStore, this.handleLoadPostComplete)
    if(!PostStore.get(this.props.params.id)) {
      this.fetchData()
    }
  },

  componentDidMount() {
    this.listenTo(PostStore, this.handleLoadPostComplete)
    if(!PostStore.get(this.props.params.id))
      this.fetchData()
  },

  fetchData() {
    this.setState({ loading: true }, () => {
      PostActions.load(this.props.params.id)
    })
  },

  handleLoadPostComplete(posts) {
    this.setState({
      loading: false,
      posts: posts[this.props.params.id]
    })
  },

  titleChanged(e) {
    console.log(e.target.value)
  },

  updateBody(e) {
    console.log(e.target.value)
  },

  handleUpdatePost() {
    let post = {
      post: {
        title: this.refs.title.value,
        slug: this.refs.slug.value,
        body: this.refs.textarea.value
      }
    }

    PostActions.save(this.props.params.id, post)
  },

  render() {
    if (this.state.loading)
      return <p>Loading Post...</p>

    const post = PostStore.get(this.props.params.id)
    if(!post) {
      return <p>Post Not Found</p>
    }

    return (
      <div className="post-form">

        <input ref="title" type="text" className="input title"
          value={post.title} onChange={this.titleChanged} />

        <input ref="slug" type="text"
          className="input slug" value={post.slug} />

        <textarea ref="textarea" defaultValue={post.attributes.body}
          className="editor"
          onChange={this.updateBody}>
        </textarea>

        <button onClick={this.handleUpdatePost}
          className="update-post">Save</button>

      </div>
    )
  }
})

export default PostEditPage
