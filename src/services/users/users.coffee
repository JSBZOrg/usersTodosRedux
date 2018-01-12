export default (
  config
) ->
  # user signup
  signup: (
    request
    data
  ) ->
    request config.signup.uri()
    ,
      method: config.signup.method
      headers: config.signup.headers
      data: data

  # user login
  login: (
    request
    data
  ) ->
    request config.login.uri()
    ,
      method: config.login.method
      headers: config.login.headers
      data: data
  
  # fetch one userInfo
  fetch: (
    request
    data
  ) ->
    request (config.fetch.uri data)
    ,
      method: config.fetch.method   
      headers: config.fetch.headers
      data: data

  # fetch all userInfo
  fetchAll: (
    request
    data
  ) ->
    request config.fetchAll.uri()
    ,
      method: config.fetchAll.method
      headers: config.fetchAll.headers
      data: data

  # verUser Email
  verEmail: (
    request
    data
  ) ->
    request config.verEmail.uri()
    ,
      method: config.verEmail.method
      headers: config.verEmail.headers
      data: data
  
  # reset user password with Email
  resetPsdWithEmail: (
    request
    data
  ) ->
    request config.resetPsdWithEmail.uri()
    ,
      method: config.resetPsdWithEmail.method
      headers: config.resetPsdWithEmail.headers
      data: data

  # reset user password
  resetPsd: (
    request
    data
  ) ->
    request (config.resetPsd.uri data)
    ,
      method: config.resetPsd.method
      headers: (config.resetPsd.headers data)
      data: data
  
  # update user information
  update: (
    request
    data
  ) ->
    request (config.update.uri data)
    ,
      method: config.update.method
      headers: (config.update.headers data)
      data: data

  # reset user sessionToken
  resetSessionToken: (
    request
    data
  ) ->
    request (config.resetSessionToken.uri data)
    ,
      method: config.resetSessionToken.method
      headers: (config.resetSessionToken.headers data)
      data: data

  # delete user
  delete: (
    request
    data
  ) ->
    request (config.delete.uri data)
    ,
      method: config.delete.method
      headers: (config.delete.headers data)
      data: data
