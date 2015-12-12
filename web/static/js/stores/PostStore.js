import AppDispatcher from '../AppDispatcher'
import ActionTypes from '../constants/ActionTypes'
import ObjectAssign from 'object-assign'
import { EventEmitter } from 'events'
import _ from 'underscore'

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
  switch(payload.action) {
    case ActionTypes.GET_POST_RESPONSE:
      let posts = payload.response
      _store.list = posts
      PostStore.emit(CHANGE_EVENT)
      break;

    default:
      return true;
  }
})

export default PostStore
