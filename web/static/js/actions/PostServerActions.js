import AppDispatcher from '../AppDispatcher'
import ActionTypes from '../constants/ActionTypes'

module.exports = {
  receivePosts: function(response) {
    AppDispatcher.dispatch({
      source: "SERVER_ACTION",
      action: ActionTypes.GET_POST_RESPONSE,
      response: response
    })
  }
}
