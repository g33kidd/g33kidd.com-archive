import AppDispatcher from '../AppDispatcher'
import ActionTypes from '../constants/ActionTypes'
import ObjectAssign from 'object-assign'
import { EventEmitter } from 'events'

const CHANGE_EVENT = 'change';
var _store = {
  list: [],
  editing: false
}

const PostStore = ObjectAssign({}, EventEmitter.prototype, {
  addChangeListener(cb) {
    this.on(CHANGE_EVENT, cb)
  },

  removeChangeListener(cb) {
    this.removeListener(CHANGE_EVENT, cb)
  },

  getList() {
    return _store
  }
});

AppDispatcher.register(function(payload) {
  let action = payload.action

  switch(action.actionType) {
    case ActionTypes.GET_POST_RESPONSE:
      let newPost = action.response.results[0]
      _store.list.push(newPost)
      PostStore.emit(CHANGE_EVENT)
      break;

    default:
      return true;
  }
})

export default PostStore
