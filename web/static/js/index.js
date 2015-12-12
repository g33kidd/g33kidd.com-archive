// Import the stylesheets
import '../css/admin.scss'

// import Socket from "./socket";
import React from 'react'
import ReactDOM from 'react-dom'
import Root from './Root'
import history from './History'

const rootEl = document.getElementById('root')

ReactDOM.render(<Root history={history} />, rootEl)
