import Reflux from 'reflux'
import request from 'reqwest'

import PostActions from '../actions/Actions'

const PostStore = Reflux.createStore({

  baseUrl: "/api/posts",
  postList: [],

  getInitialState() {
    this.fetchPosts()
  },

  fetchPosts() {
    var self = this
    request({ url: this.baseUrl, method: "get",
      error(err) { return console.error(err) },
      success(resp) {
        this.postList = resp.data
        self.trigger(this.postList)
      }
    })
  },

  newPost() {
    var self = this
    request({
      url: this.baseUrl,
      method: "post",
      data: { post: { title: "New Post", body: "## Some Markdown", slug: "new-test-post", user_id: 0 } },
      error(err) { return console.error(err) },
      success(resp) {
        self.trigger(this.postList)
      }
    })
  }

})

export default PostStore
