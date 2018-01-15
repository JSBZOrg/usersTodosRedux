import 'shelljs/make'
import dd from 'ddeyes'
import {
  userLogin
  todoCreate
  todoUpdate
  todoDelete
} from './sagas'

target.all = =>
  dd 'hello, userTodoApp!!'

target.sagas = =>
  await userLogin '测试', '123456'
  data = await todoCreate 'todo'
  await todoCreate 'ceshi'
  await todoUpdate data.objectId, '修改', true
  
  
  