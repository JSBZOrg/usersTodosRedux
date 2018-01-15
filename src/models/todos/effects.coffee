import dd from 'ddeyes'
import * as services from '../../services/todos'
import toolFuc from '../../utils/helper'

export default ({
  type
}) ->
  create: (
    { payload }
    { put }
  ) ->
    params = {
      todo: payload.todo
      user: payload.user
      isCompleted: false
    }
    data = yield services.lc.create toolFuc
    ,
      params

    results = yield services.lc.reload toolFuc
    todo = results.results

    if data?
      yield put
        type: type.save
        payload: {
          todo: todo
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'create error'

    return

  fetch: (
    { payload }
    { put }
  ) ->
    temp = []
    data = yield services.lc.reload toolFuc
    data.results.reduce (r, c, index, array) =>
      if c.isCompleted is payload.isCompleted
        temp.push array[index]
      temp
    , []

    if data?
      yield put
        type: type.save
        payload: {
          todo: temp
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'fetch error'

    return
  
  update: (
    { payload }
    { put }
  ) ->
    params = {
      objectId: payload.objectId
      todo: payload.todo
      isCompleted: payload.isCompleted
    }
    data = yield services.lc.patch toolFuc
    ,
      params

    results = yield services.lc.reload toolFuc 
    todo = results.results 

    if data?
      yield put 
        type: type.save
        payload: {
          todo: todo
        }
      yield payload.callback.success todo
    else
      yield payload.callback.fail 'patch error'

    return
  
  fetchAll: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.reload toolFuc
    todo = data.results

    if data?
      yield put 
        type: type.save
        payload: {
          todo: todo
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'reload error'
      
    return

  delete: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.remove toolFuc
    ,
      payload
    results = yield services.lc.reload toolFuc 
    todo = results.results 
    yield put 
      type: type.save
      payload: {
        todo: todo
      }

    return 