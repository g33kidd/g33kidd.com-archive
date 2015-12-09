// Import the stylesheets
import '../css/admin.scss'

// import Socket from "./socket";
import React from 'react'
import ReactDOM from 'react-dom'
import { useBasename, createHistory } from 'history'
import Root from './Root'

const rootEl = document.getElementById('root')
const history = useBasename(createHistory)({ basename: "/admin" });

ReactDOM.render(<Root history={history} />, document.getElementById("app"))
