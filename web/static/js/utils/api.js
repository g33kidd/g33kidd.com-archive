import request from 'reqwest'

const getRequest = (path, done, err) => {
  return request({
    url: path,
    method: 'get',
    success(resp) { done(resp) },
    error(error) { err(error) }
  })
}

const postRequest = (data, done, err) => {
  return request({
    url: "/api/posts",
    method: 'post',
    data: {post: data},
    success(resp) { done(resp) },
    error(error) { err(error) }
  })
}

const API = {
  baseURI: "/api",
  postPath: "/api/posts",

  get(id, done, err) {
    let path = this.postPath
    if(id) {
      path = `${this.postPath}/${id}`
    }
    getRequest(path, done, err)
  },

  post(post, done, err) {
    let path = this.postPath
    postRequest(post, done, err)
  }
}

export default API

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

// module.exports = {
//   getPosts() {
//     request({
//       url: "/api/posts",
//       method: "get",
//       error(err) {
//         return console.error(err)
//       },
//       success(resp) {
//         PostServerActions.receivePosts(resp.data)
//       }
//     })
//   },
//
//   getPost(id) {
//     request({
//       url: `/api/posts/${id}`,
//       method: "get",
//       error(err) { return console.error(err) },
//       success(resp) {
//         PostServerActions.receivePost(resp.data)
//       }
//     })
//   },
//
//   createPost() {
//
//   }
//   // get(url) {
//   //   request({
//   //     url:
//   //   })
//   //   // request.get(url)
//   //   //   .set("Accept", "application/json")
//   //   //   .end(function(err, response) {
//   //   //     if(err) return console.error(err);
//   //   //
//   //   //     PostServerActions.receivePost(response.body.data)
//   //   //   });
//   // },
// }
