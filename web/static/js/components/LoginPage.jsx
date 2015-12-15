import _ from 'lodash'
import React from 'react'
import AuthActions from '../actions/AuthActions'
import SessionStore from '../stores/SessionStore'

import History from '../History'

const LoginForm = React.createClass({
  componentDidMount() {
    let jwToken = localStorage.getItem('token')
    if(jwToken) {
      AuthActions.autoLogin(jwToken)
      History.replaceState(null, "/posts")
    }
  },

  handleLogin(e) {
    e.preventDefault();
    let username = this.refs.username.value
    let password = this.refs.password.value
    AuthActions.login(username, password)
  },

  renderAuthErrors() {
    let errors = SessionStore.getAuthErrors()
    if(errors.length === 0) { return null }
    return (
      <ul className="errors"></ul>
    )
  },

  render() {
    let buttonText = SessionStore.isAuthRequestInProgress() ? 'Loggin in...' : 'Login'
    return (
      <div className="login-page">
        <div className="login-container">
          <h2 className="header">Login</h2>
          <form onSubmit={this.handleLogin} autoComplete="off">
            { this.renderAuthErrors() }
            <input type="text" name="username" ref="username" />
            <input type="password" name="password" ref="password" />
            <button disabled={SessionStore.isAuthRequestInProgress()}>{buttonText}</button>
          </form>
        </div>
      </div>
    )
  }
})

export default LoginForm
