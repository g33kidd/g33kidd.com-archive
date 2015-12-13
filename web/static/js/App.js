import React, { PropTypes } from 'react'

import Header from './components/Header'
import PostActions from './actions/Actions'

export default class App extends React.Component {
  render() {
    setInterval(() => {
      PostActions.getPosts()
    }, 5000)

    return (
      <div className="app">
        <Header />
        <div className="container">{this.props.children}</div>
      </div>
    )
  }
}
