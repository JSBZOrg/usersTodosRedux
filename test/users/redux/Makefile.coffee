import dd from 'ddeyes'
import 'shelljs/make'
import {
  staticFuc
} from './reduce'

import {
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
} from './sagas'

target.all = =>
  dd 'Hello userTodoApp ！'

target.static = =>
  staticFuc()
  
target.sagas = =>
  # data = await userSignup '测试', '123456'
  data = await userLogin '测试', '123456'
  # await userFetch()
  # await todoCreate()