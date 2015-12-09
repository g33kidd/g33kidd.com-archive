import "../css/admin.scss";

import React from "react";
import ReactDOM from "react-dom";

class Header extends React.Component {
  render() {
    return (
      <ul className="nav">
        <li><a href="#">View Posts</a></li>
        <li><a href="#">New Post</a></li>
      </ul>
    )
  }
}

ReactDOM.render(<Header />, document.getElementById('admin-header'))
