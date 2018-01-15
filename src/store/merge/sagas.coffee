import dd from 'ddeyes'
import { sagaEffects } from 'cfx.redux-saga'
import constants from './constants'
import TodoSagas from '../../models/todos/effects'
import UserSagas from '../../models/users/effects'

TODOSAGAS = TodoSagas
  type:
    save: 'TODO_SAVE'
    create: 'TODO_CREATE'
    update: 'TODO_UPDATE'
    delete: 'TODO_DELETE'
    deleteAll: 'TODO_DELETE_ALL'
    fetch: 'TODO_FETCH'
    fetchAll: 'TODO_FETCH_ALL'

USERSAGAS = UserSagas
  type:
    save: 'USER_SAVE'
    signup: 'USER_SIGNUP'
    login: 'USER_LOGIN'
    fetch: 'USER_FETCH'
    fetchAllUserInfo: 'USER_FETCH_ALL'
    verUserEmail: 'USER_VER_EMAIL'
    resetUserPsdWithEmail: 'USER_RESET_PSD_WITH_EMAIL'
    resetUserPsd: 'USER_RESET_PSD'
    updateUserInfo: 'USER_UPDATE'
    resetUserSessionToken: 'USER_RESET_SESSIONTOKEN'
    deleteUser: 'USER_DELETE'
    refreshToken: 'USER_REFRESH_TOKEN'
{
  put
  takeLatest
} = sagaEffects

{
  # todo
  TODO_SAVE
  TODO_CREATE
  TODO_UPDATE
  TODO_DELETE
  TODO_DELETE_ALL
  TODO_FETCH
  TODO_FETCH_ALL
  # user
  USER_SAVE
  USER_SIGNUP
  USER_LOGIN
  USER_FETCH
  USER_FETCH_ALL
  USER_VER_EMAIL
  USER_RESET_PSD_WITH_EMAIL
  USER_RESET_PSD
  USER_UPDATE
  USER_RESET_SESSIONTOKEN
  USER_DELETE
  USER_REFRESH_TOKEN
} = constants.types

todos =

  create: (action) ->
    TODOSAGAS.create action
    , {
      put
    }

  update: (action) ->
    TODOSAGAS.update action
    , {
      put
    }
  
  delete: (action) ->
    TODOSAGAS.delete action
    , {
      put
    }

  deleteAll: (action) ->
    TODOSAGAS.deleteAll action
    , {
      put
    }

  fetch: (action) ->
    TODOSAGAS.fetch action
    , {
      put
    }

  fetchAll: (action) ->
    TODOSAGAS.fetchAll action
    , {
      put
    }

users = 

  signup: (action) ->
    USERSAGAS.signup action
    , {
      put
    }
  
  login: (action) ->
    USERSAGAS.login action
    , {
      put
    }
  
  fetch: (action) ->
    USERSAGAS.fetch action
    , {
      put
    }
  
  fetchAllUserInfo: (action) ->
    USERSAGAS.fetchAllUserInfo action
    , {
      put
    }
  
  verUserEmail: (action) ->
    USERSAGAS.verUserEmail action
    , {
      put
    }
  
  resetUserPsdWithEmail: (action) ->
    USERSAGAS.resetUserPsdWithEmail action
    , {
      put
    }
  
  resetUserPsd: (action) ->
    USERSAGAS.resetUserPsd action
    , {
      put
    }
  
  updateUserInfo: (action) ->
    USERSAGAS.updateUserInfo action
    , {
      put
    }
  
  resetUserSessionToken: (action) ->
    USERSAGAS.resetUserSessionToken action
    , {
      put
    }
  
  deleteUser: (action) ->
    USERSAGAS.deleteUser action
    , {
      put
    }
  
  refreshToken: (action) ->
    USERSAGAS.refreshToken action
    , {
      put
    }
  
export default [
  # todo
  ->
    yield takeLatest TODO_CREATE
    , todos.create
  ->
    yield takeLatest TODO_UPDATE
    , todos.update
  ->
    yield takeLatest TODO_DELETE
    , todos.delete
  ->
    yield takeLatest TODO_DELETE_ALL
    , todos.deleteAll
  ->
    yield takeLatest TODO_FETCH
    , todos.fetch
  ->
    yield takeLatest TODO_FETCH_ALL
    , todos.fetchAll

  # user
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
    , users.fetchAllUserInfo
  ->
    yield takeLatest USER_VER_EMAIL
    , users.verUserEmail
  ->
    yield takeLatest USER_RESET_PSD_WITH_EMAIL
    , users.resetUserPsdWithEmail
  ->
    yield takeLatest USER_RESET_PSD
    , users.resetUserPsd
  ->
    yield takeLatest USER_UPDATE
    , users.updateUserInfo
  ->
    yield takeLatest USER_RESET_SESSIONTOKEN
    , users.resetUserSessionToken
  ->
    yield takeLatest USER_DELETE
    , users.deleteUser
  ->
    yield takeLatest USER_REFRESH_TOKEN
    , users.refreshToken
]
