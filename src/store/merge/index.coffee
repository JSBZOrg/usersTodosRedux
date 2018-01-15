import { getStore } from 'cfx.redux'
import constants from './constants'
import actions from './actions'
import reducers from './reducers'
import sagas from './sagas'
import {
  todos
  login
  initialState
} from './reducers'

store = getStore {
  appName: 'todosApp'
  reducers
  sagas
}

export {
  constants
  actions
  reducers
  todos
  login
  initialState
  sagas
  getStore
  store
}
