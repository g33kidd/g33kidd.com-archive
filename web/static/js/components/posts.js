import React from "react";
import Reqwest from 'reqwest'

class Post extends React.Component {
  render() {
    return (
      <div className="post">
        <div className="title">{this.props.title}</div>
        <div className="body">{this.props.body}</div>
      </div>
    )
  }
}

const PostView = React.createClass({
  getInitialState() {
    return {data: []}
  },
  componentDidMount() {
    this.setState({
      data: [
        {id: 1, title: "Fake Title", body: "Fake Content"},
        {id: 2, title: "Fake Title", body: "Fake Content"},
        {id: 3, title: "Fake Title", body: "Fake Content"},
      ]
    })
  },
  render() {
    return (
      <div className="post-view">
        <PostList data={this.state.data} />
      </div>
    )
  }
})

class PostList extends React.Component {
  render() {
    let posts = this.props.data.map(function(post) {
      return (
        <Post key={post.id} title={post.title} body={post.body} />
      )
    })

    return (
      <div className="post-list">
        {posts}
      </div>
    )
  }
}

class PostPage extends React.Component {
  render() {
    return <PostView />
  }
}

export default PostPage
