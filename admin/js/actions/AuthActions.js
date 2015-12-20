import Reflux from 'reflux'

const AuthActions = Reflux.createActions({
  'login': { asyncResult: true },
  'autoLogin': {},
  'logout': {}
})

export default AuthActions
