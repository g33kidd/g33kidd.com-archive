import request from 'reqwest'

const baseUrl = "/api"
const postUrl = "/api/posts"
const makeRequest = (path, method, data) => {
  if(method === 'post') {
    return request({ url: path, method: 'post', data: data })
  }else{
    return request({ url: path, method: method, data: data })
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
    return makeRequest(postUrl, 'post', post);
  },

  // DELETE /api/posts/:id
  // deletes a post by the id
  destroy(id) {
    let path = `${postUrl}/${id}`
    return makeRequest(path, 'delete', { id: id })
  }
}

export default PostApi
