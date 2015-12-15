import React, { Component } from 'react'
import Reflux, { ListenerMixin } from 'reflux'

import PostActions from '../actions/PostActions'
import PostStore from '../stores/PostStore'

const Editor = React.createClass({
  componentDidMount() {

  },

  render() {
    return <textarea></textarea>
  }
})

const PostEditPage = React.createClass({
  mixins: [ListenerMixin],

  getInitialState() {
    const postId = this.props.params.id
    const post = PostStore.getInitialState().posts
    return {
      loading: !PostStore.get(this.props.params.id),
      posts: post
    }
  },

  componentWillReceiveProps(nextProps) {
    console.log(nextProps)
    if(!PostStore.get(nextProps.id))
      this.fetchData()
  },

  componentDidMount() {
    this.listenTo(PostStore, this.handleLoadPostComplete)
    if(!PostStore.get(this.props.params.id))
      this.fetchData()
    let uniqueId = `editor-${this.props.params.id}`
    this.editor = new SimpleMDE({
      autofocus: true,
      autosave: {
        enabled: true,
        uniqueId: uniqueId
      }
    })
  },

  getTitle() {},

  getBody() {},

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

  handleUpdatePost() {
    let post = {
      post: {
        title: this.refs.title.value,
        slug: this.refs.slug.value,
        body: this.editor.value()
      }
    }

    PostActions.save(this.props.params.id, post)
  },

  render() {
    if (this.state.loading)
      return <p>Loading Post...</p>

    const post = PostStore.get(this.props.params.id)
    if(!post)
      return <p>Post Not Found</p>

    return (
      <div className="post-form">
        <div>
          <input type="text" className="input title" value={post.title}
            ref="title" onChange={this.titleChanged} />
        </div>
        <div>
          <input type="text" className="input slug" ref="slug" value={post.slug} />
        </div>
        <div>
          <textarea defaultValue={post.attributes.body} ref="body"></textarea>
        </div>
        <button onClick={this.handleUpdatePost} className="update-post">Save</button>
      </div>
    )
  }
})

export default PostEditPage
