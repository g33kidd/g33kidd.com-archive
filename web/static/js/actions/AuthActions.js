import Reflux from 'reflux'

const AuthActions = Reflux.createActions({
  'login': { asyncResult: true },
  'logout': {}
})

export default AuthActions
