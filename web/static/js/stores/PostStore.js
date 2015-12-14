import _ from 'lodash'
import Reflux from 'reflux'
import PostActions from '../actions/PostActions'

const PostStore = Reflux.createStore({
  listenables: PostActions,
  posts: {},

  getInitialState() { return this.posts },

  get(id) { return this.posts[id] },

  onLoadCompleted(posts) {
    console.log(posts)
    if(posts instanceof Array) {
      posts = _.indexBy(posts, 'id')
      this.loaded = true
    }

    _.assign(this.posts, posts)
    this.trigger(this.posts)
  },

  onLoadFailed(err) {
    console.error(err)
  },

  onCreateCompleted() {},

  onCreateFailed(err) {
    console.error(err)
  },

  // removes post from the store
  onDestroyCompleted(id) {
    delete this.posts[id]
    this.trigger(this.posts)
  },

  onDestroyFailed(err) {
    console.error(err)
  }

  // get(id) {
  //   return this.posts[id]
  // },
  //
  // onDeleteCompleted(id) {
  //   delete this.posts[id]
  //   this.trigger(this.posts)
  // },
  //
  // onDeleteFailed(err) {
  //   console.error(err)
  // },
  //
  // onCreateCompleted(posts) {
  //   if(posts instanceof Array) {
  //     posts = _.indexBy(posts, 'id')
  //     this.loaded = true
  //   }
  //
  //   _.assign(this.posts, posts)
  //   this.trigger(this.posts)
  // },
  //
  // onCreateFail(err) {
  //   console.error(err)
  // },
  //
  // onLoadCompleted(posts) {
  //   if(posts instanceof Array) {
  //     posts = _.indexBy(posts, 'id')
  //     this.loaded = true
  //   }
  //
  //   _.assign(this.posts, posts)
  //   this.trigger(this.posts)
  // },
  //
  // onLoadFail(err) {
  //   console.error(err)
  // },
  //
  // getInitialState() {
  //   return this.posts
  // }

})

export default PostStore
