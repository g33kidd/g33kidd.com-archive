import AppDispatcher from '../AppDispatcher'
import ActionTypes from '../constants/ActionTypes'
import APIUtils from '../utils/APIUtils'
import history from '../History'

module.exports = {
  getPosts() {
    AppDispatcher.dispatch({
      source: "VIEW_ACTION",
      action: ActionTypes.GET_POSTS
    })

    APIUtils.getPosts()
  },

  newPost() {
    AppDispatcher.dispatch({
      source: "VIEW_ACTION",
      action: ActionTypes.NEW_POST
    })

    // APIUtils.createPost()
    history.replaceState(null, '/posts')
  }
}
