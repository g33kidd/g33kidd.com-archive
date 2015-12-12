import request from 'reqwest'
import PostServerActions from '../actions/PostServerActions'

// var makeRequest = (url, method, cb, error) => {
//   request({
//     url: url,
//     type: 'json',
//     method: method,
//     contentType: "application/json",
//     headers: {
//       "Access-Token": "SOME_TOKEN"
//     }
//   })
// }

module.exports = {
  getPosts() {
    request({
      url: "/api/posts",
      method: "get",
      error(err) {
        return console.error(err)
      },
      success(resp) {
        PostServerActions.receivePosts(resp.data)
      }
    })
  },

  getPost(id) {
    request({
      url: `/api/posts/${id}`,
      method: "get",
      error(err) { return console.error(err) },
      success(resp) {
        PostServerActions.receivePost(resp.data)
      }
    })
  },

  createPost() {

  }
  // get(url) {
  //   request({
  //     url:
  //   })
  //   // request.get(url)
  //   //   .set("Accept", "application/json")
  //   //   .end(function(err, response) {
  //   //     if(err) return console.error(err);
  //   //
  //   //     PostServerActions.receivePost(response.body.data)
  //   //   });
  // },
}
