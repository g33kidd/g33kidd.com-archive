import React from 'react'
import { Link } from 'react-router'

import PostActions from '../actions/PostActions'
import SessionStore from '../stores/SessionStore'
import AuthActions from '../actions/AuthActions'

export default class Header extends React.Component {
  handleNewPost(e) {
    e.preventDefault()
    let post = {
      post: {
        title: "New Post",
        body: "## Write Some Markdown Here...",
        user_id: 0
      }
    }

    PostActions.create(post)
  }

  handleLogout(e) {
    e.preventDefault()
    AuthActions.logout()
  }

  render() {
    return (
      <header className="admin-header">
        <div className="container">
          <ul className="nav">
            <li><Link to="">Dashboard</Link></li>
            <li><Link to="posts">Posts</Link></li>
            <li><a href="#" onClick={this.handleNewPost}>New Post</a></li>
            <li><Link to="settings">Settings</Link></li>
            <li><a href="#" onClick={this.handleLogout}>Logout</a></li>
          </ul>
        </div>
      </header>
    )
  }
}
