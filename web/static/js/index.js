// Import the stylesheets
import '../css/admin.scss'

// import Socket from "./socket";
import React from 'react'
import { render } from 'react-dom'
import { createHistory, useBasename } from 'history'
import { Router, Route } from 'react-router'

const history = useBasename(createHistory)({ basename: "/admin" });

import App from './components/app';
import PostPage from './components/posts'

render((
  <Router history={history}>
    <Route path="/" component={App}>
      <Route path="posts" component={PostPage} />
    </Route>
  </Router>
), document.getElementById("app"))
