import request from 'reqwest'

const AuthApi = {
  login(username, password) {
    return request({
      url: "/api/auth",
      data: { username: username, password: password },
      method: "post"
    })
  }
}

export default AuthApi
