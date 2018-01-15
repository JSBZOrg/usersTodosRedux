import dd from 'ddeyes'
import uuidFunc from '../../../src/utils/randomId'
import * as store from '../../../src/store/all'

{
  constants
  actions
  reducers
  getStore
} = store

myStore = getStore {
  appName: 'userTodoApp'
  reducers
  subscriber:
    sync: ->
      dd myStore.getState()
}

# static 
staticFuc = =>
  dd {
    constants
    actions
  }

# reducers 
todoSave = =>
  myStore.dispatch actions.todoSave
    todo: '测试一'

todoPatch = =>
  myStore.dispatch actions.todoPatch
    objectId: myStore.getState().userTodoApp.todos[0].objectId
    todo: '修改'
    isCompleted: true

todoReload = =>
  myStore.dispatch actions.todoReload
    todo: []

todoRemove = =>
  myStore.dispatch actions.todoRemove
    objectId: myStore.getState().userTodoApp.todos[0].objectId
  
todoRemoveAll = =>
  myStore.dispatch actions.todoRemoveAll
    todo: []

export {
  staticFuc
  todoSave
  todoPatch
  todoReload
  todoRemove
  todoRemoveAll
}