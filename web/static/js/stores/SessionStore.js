import Reflux from 'reflux'
import AuthActions from '../actions/AuthActions'
import AuthApi from '../utils/AuthApi'

import History from '../History'
import jwtDecode from 'jwt-decode'
import localstorage from 'localStorage'

const SessionStore = Reflux.createStore({
  listenables: [AuthActions],

  sessionState: {
    authRequestInProgress: false,
    authErrors: [],
    authToken: null,
    userData: {}
  },

  onAutoLogin(token) {
    var decoded_token = jwtDecode(token)
    this.sessionState.authErrors = []
    this.sessionState.authToken = token
    this.sessionState.authRequestInProgress = false
    this.sessionState.userData = decoded_token
    History.replaceState(null, "/")
    this.trigger(this.sessionState)
  },

  onLogin(username, password) {
    this.sessionState.authRequestInProgress = true
    AuthApi.login(username, password)
      .then(AuthActions.login.completed)
      .catch(AuthActions.login.failed)
    this.trigger(this.sessionState)
  },

  onLoginCompleted(resp) {
    localStorage.setItem('token', resp.auth_token)
    this.sessionState.authRequestInProgress = false
    this.sessionState.authErrors = []
    this.sessionState.authToken = resp.auth_token
    this.sessionState.userData = resp.user_data
    History.replaceState(null, "/")
    this.trigger(this.sessionState)
  },

  onLoginFailed(err) {
    console.error(err)
  },

  onLogout() {
    this.sessionState = {
      authRequestInProgress: false,
      authErrors: [],
      authToken: null,
      userData: {}
    }
    localStorage.removeItem('token')
    History.replaceState(null, "/login")
    this.trigger(this.sessionState)
  },

  getUsername() {
    return this.sessionState.userData.username
  },

  getAuthToken() {
    return this.sessionState.authToken
  },

  getUserId() {
    return this.sessionState.userData.id
  },

  isLoggedIn() {
    return (this.sessionState.authToken !== null)
  },

  getAuthErrors() {
    return (this.sessionState.authErrors !== null)
  },

  isAuthRequestInProgress() {
    return (this.sessionState.authRequestInProgress === true)
  }
})

export default SessionStore
