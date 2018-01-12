import dd from 'ddeyes'
import uuid from '../../../src/utils/randomId'
import * as store from '../../../src/store/users'

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
userSave = =>
  


export {
  staticFuc
}