import _ from 'lodash'
import React from 'react'
import AuthActions from '../actions/AuthActions'
import SessionStore from '../stores/SessionStore'

const LoginForm = React.createClass({
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
        <h2 className="header">Login</h2>
        <form onSubmit={this.handleLogin}>
          { this.renderAuthErrors() }
          <input type="text" name="username" ref="username" />
          <input type="password" name="password" ref="password" />
          <button disabled={SessionStore.isAuthRequestInProgress()}>{buttonText}</button>
        </form>
      </div>
    )
  }
})

export default LoginForm
