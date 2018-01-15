import dd from 'ddeyes'
import isEqual from 'is-equal'
import * as store from '../../../src/store/merge'
import { verify } from '../../../src/utils/jwt'

{
  constants
  actions
  reducers
  sagas
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
  appName: 'userTodoApp'
  reducers
  sagas
  subscriber:
    async: subscriber
}

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

todoCreate = (todo) =>
  objectId = verify(myStore.getState().userTodoApp.login.jwt).objectId
  new Promise (resolve, reject) =>
    myStore.dispatch actions.todoCreate 
      todo: todo
      user:
        __type: 'Pointer'
        className: "_User"
        objectId: objectId
      callback:
        success: (data) =>
          resolve data
        fail: (data) =>
          reject data

todoUpdate = (objectId, todo, isCompleted) =>
  new Promise (resolve, reject) =>
    myStore.dispatch actions.todoUpdate
      objectId: objectId
      todo: todo
      isCompleted: isCompleted
      callback:
        success: (data) =>
          resolve data
        fail: (data) =>
          reject data

todoDelete = (objectId) =>
  myStore.dispatch actions.todoDelete
    objectId: objectId

export {
  userLogin
  todoCreate
  todoUpdate
  todoDelete
}