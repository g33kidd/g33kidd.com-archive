import AppDispatcher from '../AppDispatcher'
import ActionTypes from '../constants/ActionTypes'
import APIUtils from '../utils/APIUtils'

module.exports = {

  addPost: function() {
    AppDispatcher.handleViewAction({
      actionType: ActionTypes.NEW_POST
    })
  },

  savePost: function(text) {
    AppDispatcher.handleViewAction({
      actionType: ActionTypes.SAVE_POST,
      text: text
    })
  },

  removePost: function() {},

  getPost: function() {
    AppDispatcher.handleViewAction({
      actionType: ActionTypes.GET_POST
    })

    APIUtils.get("/posts")
  }

}
