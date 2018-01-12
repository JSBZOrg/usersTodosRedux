import { sagaEffects } from 'cfx.redux-saga'
import dd from 'ddeyes'
import constants from './constants'
import getUserSagas from '../../models/users/effects'

userSagas = getUserSagas
  type:
    save: 'USER_SAVE'
    signup: 'USER_SIGNUP'
    login: 'USER_LOGIN'
    fetch: 'USER_FETCH'
    fetchAll: 'USER_FETCH_ALL'
    verEmail: 'USER_VER_EMAIL'
    resetPsdWithEmail: 'USER_RESET_PSD_WITH_EMAIL'
    resetPsd: 'USER_RESET_PSD'
    resetSessionToken: 'USER_RESET_SESSIONTOKEN'
    update: 'USER_UPDATE'
    delete: 'USER_DELETE'
    refreshToken: 'USER_REFRESH_TOKEN'
  
{
  put
  takeLatest
} = sagaEffects

{
  USER_SAVE
  USER_SIGNUP
  USER_LOGIN
  USER_FETCH
  USER_FETCH_ALL
  USER_VER_EMAIL
  USER_RESET_PSD_WITH_EMAIL
  USER_RESET_PSD
  USER_RESET_SESSIONTOKEN
  USER_UPDATE
  USER_DELETE
  USER_REFRESH_TOKEN
} = constants.types

users =

  signup: (action) ->
    userSagas.signup action
    , {
      put
    }

  login: (action) ->
    userSagas.login action
    , {
      put
    }

  fetch: (action) ->
    userSagas.fetch action
    , {
      put
    }

  fetchAll: (action) ->
    userSagas.fetchAll action
    , {
      put
    }
  
  verEmail: (action) ->
    userSagas.verEmail action
    , {
      put
    }

  resetPsdWithEmail: (action) ->
    userSagas.resetPsdWithEmail action
    , {
      put
    }

  resetPsd: (action) ->
    userSagas.resetPsd action
    , {
      put
    }

  resetSessionToken: (action) ->
    userSagas.resetSessionToken action
    , {
      put
    }
  
  update: (action) ->
    userSagas.update action
    , {
      put
    }
  
  delete: (action) ->
    userSagas.delete action
    , {
      put
    }
  
  refreshToken: (action) ->
    userSagas.refreshToken action
    , {
      put
    }
  
export default [
  ->
    yield takeLatest USER_SIGNUP
    , users.signup
  ->
    yield takeLatest USER_LOGIN
    , users.login
  ->
    yield takeLatest USER_FETCH
    , users.fetch
  ->
    yield takeLatest USER_FETCH_ALL
    , users.fetchAll
  ->
    yield takeLatest USER_VER_EMAIL
    , users.verEmail
  ->
    yield takeLatest USER_RESET_PSD_WITH_EMAIL
    , users.resetPsdWithEmail
  ->
    yield takeLatest USER_RESET_PSD
    , users.resetPsd
  ->
    yield takeLatest USER_RESET_SESSIONTOKEN
    , users.resetSessionToken
  ->
    yield takeLatest USER_UPDATE
    , users.update
  ->
    yield takeLatest USER_DELETE   
    , users.delete
  ->
    yield takeLatest USER_REFRESH_TOKEN
    , users.refreshToken
]
