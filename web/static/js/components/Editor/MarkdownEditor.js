// import 'codemirror/lib/codemirror.css'

var CodeMirror = require('codemirror');

import React, { Component } from 'react'
import { findDOMNode } from 'react-dom'
import classNames from 'classnames'

import 'codemirror/mode/xml/xml'
import 'codemirror/mode/markdown/markdown'
import 'codemirror/addon/edit/continuelist'

const MarkdownEditor = React.createClass({
  propTypes: {
    onChange: React.PropTypes.func,
    options: React.PropTypes.object,
    path: React.PropTypes.string,
    value: React.PropTypes.string
  },

  getInitialState() {
    return {
      isFocused: false,
      cs: {}
    }
  },

  componentDidMount() {
    this.codeMirror = CodeMirror.fromTextArea(this.refs.codemirror, this.getOptions())
    this.codeMirror.on('change', this.codeMirrorValueChanged)
    this.codeMirror.on('focus', this.focusChanged.bind(this, true))
    this.codeMirror.on('blur', this.focusChanged.bind(this, false))
    // this.codeMirror.on('')
    this._currentCodeMirrorValue = this.props.value;
  },

  // Removes the CodeMirror instance
  componentWillUnmount() {
    if(this.codeMirror) {
      this.codeMirror.toTextArea();
    }
  },

  updateCursorState() {
    this.setState({
      cs: getCursorState(this.codeMirror)
    })
  },

  getOptions() {
    return Object.assign({
      mode: 'markdown',
      lineNumbers: false,
      indentWithtabs: true,
      tabSize: '2'
    }, this.props.options);
  },

  componentWillReceiveProps(nextProps) {
    if(this.codeMirror && this._currentCodeMirrorValue !== nextProps.value) {
      this.codeMirror.setValue(nextProps.value);
    }
  },

  codeMirrorValueChanged(doc, change) {
    let newVal = doc.getValue();
    this._currentCodeMirrorValue = newVal;
    this.props.onChange && this.props.onChange(newVal)
  },

  getCodeMirror() {
    return this.codeMirror
  },

  focus() {
    if(this.codeMirror) {
      this.codeMirror.focus()
    }
  },

  focusChanged(focused) {
    this.setState({
      isFocused: focused
    })
  },

  toggleFormat(formatKey) {
    applyFormat(this.codeMirror, formatKey)
  },

  renderToolbar() {
    return (
      <div className="editor-toolbar">
        {this.renderButton('h1', 'h1')}
        {this.renderButton('h2', 'h2')}
        {this.renderButton('h3', 'h3')}
        {this.renderButton('bold', 'b')}
        {this.renderButton('italic', 'i')}
      </div>
    )
  },

  renderButton(formatKey, label, action) {
    if(!action) action = this.toggleFormat.bind(this, formatKey);

    let isTextIcon = (formatKey === 'h1' || formatKey === 'h2' || formatKey === 'h3');
    let className = formatKey
    return (
      <button className={className} onClick={action} title={formatKey}>
        <span className="toolbar-label">{label}</span>
      </button>
    )
  },

  render() {
    var editorClassName = classNames('md-editor', { 'md-editor--focused': this.state.isFocused })
    return (
      <div className="editor">
        <div className={editorClassName}>
          {this.renderToolbar()}
          <textarea ref="codemirror" name={this.props.path} defaultValue={this.props.value} autoComplete="off" />
        </div>
      </div>
    )
  }
})

export default MarkdownEditor
