import Reqwest from 'reqwest'
import Constants from '../constants/constants'

const Endpoints = Constants.Endpoints;

module.exports = {

  fetchPosts() {
    Reqwest({
      url: Endpoints.POSTS,

    })
  }

}
