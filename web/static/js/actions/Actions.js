import Reflux from 'reflux'

import Api from '../utils/api'

const PostActions = Reflux.createActions({
  'load': { children: ['completed', 'failed'] }
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

export default PostActions
