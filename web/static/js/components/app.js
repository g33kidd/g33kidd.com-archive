import React from 'react';
import Header from './header';

export default class App extends React.Component {
  render() {
    return (
      <div>
        <header className="admin-header">
          <Header />
        </header>
        <div className="container">
          {this.props.children}
        </div>
      </div>
    )
  }
}
