import Constants from '../constants/constants'
import request from 'superagent'

const Endpoints = Constants.Endpoints;

module.exports = {

  get(url) {
    request.get(url)
      .set("Accept", "application/json")
      .end(function(err, response) {
        if(err) return console.error(err);
        PostServerActions.receivePost(response.body)
      });
  }

}
