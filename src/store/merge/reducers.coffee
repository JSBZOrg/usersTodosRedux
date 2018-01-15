import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import TodoReducers from '../../models/todos/reducers'
import UserReducers from '../../models/users/reducers'
import dd from 'ddeyes'

initialState =
  todos: []
  login: []

# all =
todos = handleActions

  TODO_SAVE: TodoReducers.save
  TODO_PATCH: TodoReducers.patch
  TODO_RELOAD: TodoReducers.reload
  TODO_REMOVE: TodoReducers.remove
  TODO_REMOVE_ALL: TodoReducers.removeAll
  
, initialState.todos

login = handleActions

  USER_SAVE: UserReducers.save

, initialState.login

export {
  todos
  login
  initialState
}

export default mergeReduce {
  todos
  login
}
, initialState
