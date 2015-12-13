import Reflux from 'reflux'

import Api from '../utils/api'
import history from '../History'

const PostActions = Reflux.createActions({
  'load': { children: ['completed', 'failed'] },
  'create': { children: ['completed', 'failed'] },
  'delete': { children: ['completed', 'failed'] }
})

PostActions.load.listen((id) => {
  Api.get(id,
    (resp) => {
      let payload = {}
      if(id) payload[id] = resp.data
      else payload = resp.data
      PostActions.load.completed(payload)
    },
    (err) => {
      PostActions.load.failed(err)
    })
})

PostActions.create.listen((post) => {
  Api.post(post, (resp) => {
    let payload = {}
    payload[resp.data.id] = resp.data
    PostActions.create.completed(payload)
    history.replaceState(null, `/posts/${resp.data.id}`)
  }, (err) => {
    console.error(err)
    PostActions.create.failed(err)
  })
})

PostActions.delete.listen((id) => {
  Api.delete(id,
    (resp) => {
      PostActions.delete.completed(id)},
    (err) => PostActions.delete.failed(err))
})

export default PostActions
