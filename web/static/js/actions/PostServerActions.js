import AppDispatcher from '../AppDispatcher'
import ActionTypes from '../constants/ActionTypes'

module.exports = {
  receivePost: function(response) {
    AppDispatcher.handleServerAction({
      actionType: ActionTypes.GET_POST_RESPONSE,
      response: response
    })
  }
}
