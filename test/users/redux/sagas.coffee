import dd from 'ddeyes'
import isEqual from 'is-equal'
import * as store from '../../../src/store/users'
import { 
  verify
  refreshToken
} from '../../../src/utils/jwt'

{
  constants
  actions
  sagas
  reducers
  getStore
} = store

subscriber = (
  prevState
  nextState
  action
  dispatch
) =>
  return dd myStore.getState() if not isEqual prevState, nextState
  
myStore = getStore {
  appName: 'todosApp'
  sagas
  reducers
  subscriber:
    async: subscriber
}

userSignup = (username, password) =>
  myStore.dispatch actions.userSignup
    username: username
    password: password

userLogin = (username, password) =>
  new Promise (resolve, reject) =>
    myStore.dispatch actions.userLogin
      username: username
      password: password
      callback:
        success: (data) =>
          resolve data
        fail: (data) =>
          reject data

userFetch = =>
  new Promise (resolve, reject) =>
    user = myStore.getState().todosApp.users.login.user
    old_token = myStore.getState().todosApp.users.login.jwt
    if verify(old_token).err isnt undefined
      if verify(old_token).err.code is 10001
        data = refreshToken user, old_token
        myStore.dispatch actions.userRefreshToken
          data: data

    objectId = verify(old_token).objectId
    myStore.dispatch actions.userFetch
      objectId: objectId
      old_token: old_token
      callback:
        success: (data) =>
          resolve data
        fail: (data) =>
          reject data

userFetchAll = =>
  new Promise (resolve, reject) =>
    myStore.dispatch actions.userFetchAll
      data: ''
      callback:
        success: (data) =>
          resolve data
        fail: (data) =>
          reject data

userVerEmail = (email) =>
  myStore.dispatch actions.userVerEmail
    email: email
    callback:
      success: (data) =>
        resolve data
      fail: (data) =>
        reject data

userResetPsdWithEmail = (email, password) =>
  myStore.dispatch actions.userResetPsdWithEmail
    email: email
    password: password
    callback:
      success: (data) =>
        resolve data
      fail: (data) =>
        reject data

userResetPsd = (objectId, sessionToken, old_password, new_password) =>
  myStore.dispatch actions.userResetPsd
    objectId: objectId
    sessionToken: sessionToken
    old_password: old_password
    new_password: new_password
    callback:
      success: (data) =>
        resolve data
      fail: (data) =>
        reject data

userUpdate = (objectId, sessionToken, username, password, phoneNo) =>
  myStore.dispatch actions.userUpdate
    objectId: objectId
    sessionToken: sessionToken
    username: username
    password: password
    phoneNo: phoneNo
    callback:
      success: (data) =>
        resolve data
      fail: (data) =>
        reject data

userResetSessionToken = (objectId, sessionToken) =>
  myStore.dispatch actions.userResetSessionToken
    objectId: objectId
    sessionToken: sessionToken
    callback:
      success: (data) =>
        resolve data
      fail: (data) =>
        reject data

userDelete = (objectId, sessionToken) =>
  myStore.dispatch actions.userDelete
    objectId: objectId
    sessionToken: sessionToken
    callback:
      success: (data) =>
        resolve data
      fail: (data) =>
        reject data

export {
  userSignup
  userLogin
  userFetch
  userFetchAll
  userVerEmail
  userResetPsdWithEmail
  userResetPsd
  userUpdate
  userResetSessionToken
  userDelete
}