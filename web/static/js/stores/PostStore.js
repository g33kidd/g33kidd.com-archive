import Reflux from 'reflux'
import request from 'reqwest'
import { indexBy, assign } from 'lodash'

import PostActions from '../actions/Actions'

const PostStore = Reflux.createStore({
  listenables: PostActions,
  posts: {},

  get(id) {
    return this.posts[id]
  },

  onCreateCompleted(posts) {
    if(posts instanceof Array) {
      posts = indexBy(posts, 'id')
      this.loaded = true
    }
    
    assign(this.posts, posts)
    this.trigger(this.posts)
  },

  onCreateFail(err) {
    console.error(err)
  },

  onLoadCompleted(posts) {
    if(posts instanceof Array) {
      posts = indexBy(posts, 'id')
      this.loaded = true
    }

    assign(this.posts, posts)
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
