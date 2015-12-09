import React from 'react'
import { Link } from 'react-router'

export default class Header extends React.Component {
  render() {
    return (
      <div className="container">
        <ul className="nav">
          <li><Link to="/posts">Posts</Link></li>
        </ul>
      </div>
    )
  }
}
