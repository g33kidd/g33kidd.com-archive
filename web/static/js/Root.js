import React, { PropTypes, Component } from 'react'
import { Router, Route } from 'react-router'

import App from './App'

// Add the pages here..
import NewPostPage from './components/Posts/NewPostPage'
import EditPostPage from './components/Posts/EditPostPage'
import PostPage from './components/Posts/PostPage'
import SettingsPage from './components/Settings/SettingsPage'

export default class Root extends Component {
  render() {
    const history = this.props.history;
    return (
      <Router history={history}>
        <Route name='admin' path='/' component={App}>
          <Route name='posts' path='/posts' component={PostPage} />
          <Route name='newPost' path='/posts/new' component={NewPostPage} />
          <Route name="editPost" path='/posts/edit/:id' component={EditPostPage} />

          <Route name='settings' path='/settings' component={SettingsPage} />
        </Route>
      </Router>
    )
  }
}
