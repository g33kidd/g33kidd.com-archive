import Reflux from 'reflux'
import request from 'reqwest'
import _ from 'lodash'

import PostActions from '../actions/Actions'

const PostStore = Reflux.createStore({
  listenables: PostActions,
  posts: {},

  get(id) {
    return this.posts[id]
  },

  onDeleteCompleted(id) {
    delete this.posts[id]
    this.trigger(this.posts)
  },

  onDeleteFailed(err) {
    console.error(err)
  },

  onCreateCompleted(posts) {
    if(posts instanceof Array) {
      posts = _.indexBy(posts, 'id')
      this.loaded = true
    }

    _.assign(this.posts, posts)
    this.trigger(this.posts)
  },

  onCreateFail(err) {
    console.error(err)
  },

  onLoadCompleted(posts) {
    if(posts instanceof Array) {
      posts = _.indexBy(posts, 'id')
      this.loaded = true
    }

    _.assign(this.posts, posts)
    this.trigger(this.posts)
  },

  onLoadFail(err) {
    console.error(err)
  },

  getInitialState() {
    return this.posts
  }

})

export default PostStore
