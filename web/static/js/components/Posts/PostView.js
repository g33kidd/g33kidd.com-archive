import React from 'react'
import PostList from './PostList'

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

export default PostView
