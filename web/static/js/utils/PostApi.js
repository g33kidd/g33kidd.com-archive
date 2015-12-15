import request from 'reqwest'
import SessionStore from '../stores/SessionStore'

const postUrl = "/api/posts"
const makeRequest = (path, method, data) => {
  let headers = {
    "Authorization": `${SessionStore.getAuthToken()}`
  }
  if(method === 'post') {
    return request({
      url: path,
      method: 'post',
      data: data,
      headers: headers
    })
  }else{
    return request({
      url: path,
      method: method,
      data: data,
      headers: headers
    })
  }
}

const PostApi = {

  // GET /api/posts
  // GET /api/posts/:id
  // gets posts
  get(id) {
    let path = postUrl
    if(id) path = `${postUrl}/${id}`
    return makeRequest(path, 'get')
  },

  // POST /api/posts
  // creates a post
  create(post) {
    return makeRequest(postUrl, 'post', post)
  },

  update(post) {
    return makeRequest(postUrl, 'put', post)
  },

  // DELETE /api/posts/:id
  // deletes a post by the id
  destroy(id) {
    let path = `${postUrl}/${id}`
    return makeRequest(path, 'delete', { id: id })
  }
}

export default PostApi
