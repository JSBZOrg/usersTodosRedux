import jwt from 'jsonwebtoken'

token = (objectId, sessionToken) =>
  jwt.sign
    objectId: objectId
    sessionToken: sessionToken
    dateTime: Date.now()
  , 'shhh'

verify = (token) =>
  decoded = jwt.verify token, 'shhh'
  if (Date.now() - decoded.dateTime) / 1000 / 60 > 1440
    err:
      name: 'JsonWebTokenError'
      message: 'jwt is expired'
      code: 10001
  else
    objectId: decoded.objectId
    sessionToken: decoded.sessionToken

refreshToken = (user, old_token) =>
  decoded = jwt.verify old_token, 'shhh'
  newToken = token decoded.objectId, decoded.sessionToken
  return 
    login:
      user:
        user
      jwt:
        newToken



export {
  token
  verify
  refreshToken
}