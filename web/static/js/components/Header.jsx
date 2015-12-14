import React from 'react'
import { Link } from 'react-router'

import PostActions from '../actions/PostActions'

export default class Header extends React.Component {
  handleNewPost() {
    let post = {
      post: {
        title: "New Post",
        body: "## Write Some Markdown Here...",
        user_id: 0
      }
    }

    PostActions.create(post)
  }

  render() {
    return (
      <header className="admin-header">
        <div className="container">
          <ul className="nav">
            <li><Link to="">Dashboard</Link></li>
            <li><Link to="posts">Posts</Link></li>
            <li><a onClick={this.handleNewPost}>New Post</a></li>
            <li><Link to="settings">Settings</Link></li>
          </ul>
        </div>
      </header>
    )
  }
}
