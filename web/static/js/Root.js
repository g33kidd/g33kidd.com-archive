import React, { PropTypes, Component } from 'react'
import { Router, Route } from 'react-router'

import App from './App'
import PostPage from './components/Posts'

export default class Root extends Component {
  render() {
    const history = this.props.history;
    return (
      <Router history={history}>
        <Route name='admin' path='/' component={App}>
          <Route name='posts' path='/posts' component={PostPage} />
        </Route>
      </Router>
    )
  }
}
