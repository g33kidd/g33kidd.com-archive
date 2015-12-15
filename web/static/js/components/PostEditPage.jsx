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
      posts: post,
      editor: new SimpleMDE()
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
        body: this.editor.value()
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
        <div>
          <input type="text" className="input title" value={post.title}
            ref="title" onChange={this.titleChanged} />
        </div>
        <div>
          <input type="text" className="input slug" ref="slug" value={post.slug} />
        </div>
        <div>
          <textarea value={post.attributes.body} onChange={this.updateBody}></textarea>
        </div>
        <button onClick={this.handleUpdatePost} className="update-post">Save</button>
      </div>
    )
  }
})

export default PostEditPage
