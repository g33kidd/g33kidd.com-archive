import React, { PropTypes, Component } from 'react'
import { Router, Route } from 'react-router'

import App from './App'

// Add the pages here..
import NewPostPage from './components/NewPostPage'
import EditPostPage from './components/EditPostPage'
import PostPage from './components/PostPage'
import SettingsPage from './components/SettingsPage'

export default class Root extends Component {
  render() {
    const history = this.props.history;
    return (
      <Router history={history}>
        <Route name='admin' path='/' component={App}>
          <Route name='posts' path='/posts' component={PostPage} />
          <Route name="editPost" path='/posts/:id' component={EditPostPage} />
          <Route name='settings' path='/settings' component={SettingsPage} />
        </Route>
      </Router>
    )
  }
}
