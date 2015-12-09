import React from 'react'
import { Link } from 'react-router'

export default class Header extends React.Component {
  render() {
    return (
      <header className="admin-header">
        <div className="container">
          <ul className="nav">
            <li><Link to="">Dashboard</Link></li>
            <li><Link to="posts">Posts</Link></li>
          </ul>
        </div>
      </header>
    )
  }
}
