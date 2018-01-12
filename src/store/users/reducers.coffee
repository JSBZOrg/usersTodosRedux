import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import userReducers from '../../models/users/reducers'
import dd from 'ddeyes'

initialState =
  users: []

users = handleActions

  USER_SAVE: userReducers.save
  USER_PATCH: userReducers.patch
  USER_RELOAD: userReducers.reload
  USER_REMOVE: userReducers.remove
  USER_REMOVE_ALL: userReducers.removeAll

, initialState.users

export {
  users
  initialState
}

export default mergeReduce {
  users
}
, initialState
