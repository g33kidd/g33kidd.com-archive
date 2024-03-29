import Reflux from 'reflux'
import PostApi from '../utils/PostApi'
import History from '../History'

// TODO: make it easier to add endpoints...

// Let's create the Reflux Actions
// see: https://github.com/reflux/refluxjs#creating-actions
const PostActions = Reflux.createActions({
  'load': { asyncResult: true },
  'create': { asyncResult: true },
  'save': { asyncResult: true },
  'destroy': { asyncResult: true }
})

// loads all posts and will fetch a single post
PostActions.load.listen((id) => {
  PostApi.get(id)
    .then((resp) => {
      let payload = {}

      if(id) payload[id] = resp.data
      else payload = resp.data

      PostActions.load.completed(payload)
    }).catch((err) => {
      console.error(err)
      PostActions.load.failed(err)
    })
})

// creates a post given a post object.
// will create without a slug.
PostActions.create.listen((post) => {
  PostApi.create(post)
    .then((resp) => {
      let payload = {}

      if(resp.data.id) {
        payload[resp.data.id] = resp.data
        PostActions.create.completed(payload)
      }else{
        PostActions.create.failed("Post failed to create.")
      }
    }).catch((err) => {
      PostActions.load.failed(err)
    })
})

PostActions.save.listen((id, post) => {
  PostApi.update(id, post)
    .then((resp) => {
      let payload = {}

      if(resp.data.id) {
        payload[resp.data.id] = resp.data
        PostActions.save.completed(payload)
      }else{
        PostActions.save.failed(resp)
      }
    })
})

// deletes a post, given the id
PostActions.destroy.listen((id) => {
  PostApi.destroy(id)
    .then((resp) => {
      PostActions.destroy.completed(resp.id)
    }).catch((err) => {
      PostActions.destroy.failed(err)
    })
})

export default PostActions
