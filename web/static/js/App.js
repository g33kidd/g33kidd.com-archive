import React, { PropTypes } from 'react'

import Header from './components/Header'

export default class App extends React.Component {
  render() {
    return (
      <div className="app">
        <Header />
        <div className="container">{this.props.children}</div>
      </div>
    )
  }
}
