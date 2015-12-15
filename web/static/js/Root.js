import React, { PropTypes, Component } from 'react'
import { Router, Route } from 'react-router'

import App from './App'
import SessionStore from './stores/SessionStore'

// Add the pages here..
import PostEditPage from './components/PostEditPage'
import PostPage from './components/PostPage'
import SettingsPage from './components/SettingsPage'
import LoginPage from './components/LoginPage'

import History from './History'

const requireAuth = (nextState, replaceState) => {
  console.log(SessionStore.getUsername())
  if(!SessionStore.isLoggedIn()) {
    replaceState({ nextPathname: nextState.location.pathname }, '/login')
  }
}

export default class Root extends Component {
  render() {
    const history = this.props.history;
    return (
      <Router history={history}>
        <Route name='login' path='/login' component={LoginPage} />
        <Route name='admin' path='/' component={App}>
          <Route name='posts' path='/posts' component={PostPage} onEnter={requireAuth} />
          <Route name="editPost" path='/posts/:id' component={PostEditPage} onEnter={requireAuth} />
          <Route name='settings' path='/settings' component={SettingsPage} onEnter={requireAuth} />
        </Route>
      </Router>
    )
  }
}
