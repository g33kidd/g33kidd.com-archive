import React from 'react'

// TODO: Add autosave feature
// this editor should know what post it's editing so it can autosave
const MDEditor = React.createClass({
  componentDidMount() {
    this.editor = new SimpleMDE({ autofocus: true });
    this.editor.value('## Start Writing Some Markdown...')
  },
  render() {
    return(
      <textarea></textarea>
    )
  }
})

export default MDEditor
