import _ from 'lodash'
import Reflux from 'reflux'
import PostActions from '../actions/PostActions'
import History from '../History'

const PostStore = Reflux.createStore({
  listenables: PostActions,
  posts: {},

  getInitialState() {
    return this.posts
  },

  get(id) { return this.posts[id] },

  onLoadCompleted(posts) {
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

  onSaveCompleted(posts) {
    PostActions.load.completed(posts)
    this.trigger(this.posts)
  },

  onSaveFailed(err) {
    console.error(err)
  },

  onCreateCompleted(post) {
    this.loaded = false
    PostActions.load.completed(post)
    let newPost = post[Object.keys(post)[0]]
    let postPath = `/posts/${newPost.id}`
    setTimeout(() => {
      this.loaded = true
      History.replaceState(null, postPath)
    }, 1000)
    this.trigger(this.posts)
  },

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
