import dd from 'ddeyes'
import * as services from '../../services/users'
import toolFuc from '../../utils/helper'
import { token } from '../../utils/jwt'

export default ({
  type
}) ->
  signup: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.signup toolFuc
    ,
      payload

    return

  login: (
    { payload }
    { put }
  ) ->
    params = 
      username: payload.username
      password: payload.password
    
    data = yield services.lc.login toolFuc
    ,
      params

    result = token(
      data.objectId 
      data.sessionToken
    ) 

    # 对leancloud返回数据进行二次处理干掉敏感信息
    if data.objectId
      delete data.objectId
    if data.sessionToken
      delete data.sessionToken

    # 将不敏感的用户信息和加密后的用户敏感信息放入store
    storeData = 
      user:
        data
      jwt:
        result

    if data?
      yield put 
        type: type.save
        payload: 
          users: storeData
      yield payload.callback.success data
    else
      yield payload.callback.fail 'login error'

    return

  fetch: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.fetch toolFuc
    ,
      payload.objectId

    # 对leancloud返回数据进行二次处理干掉敏感信息
    if data.objectId
      delete data.objectId
    if data.sessionToken
      delete data.sessionToken

    params = 
      user:
        data
      jwt:
        payload.old_token  

    if data?
      yield put 
        type: type.save
        payload: 
          users: params
      yield payload.callback.success data
    else
      yield payload.callback.fail 'fetchUserInfo error'
      
    return
  
  fetchAllUserInfo: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.fetchAllUserInfo toolFuc
    ,
      payload.data
    if data?
      yield put 
        type: type.save
        payload: {
          users:data
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'fetchAllUserInfo error'

    return

  verUserEmail: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.verUserEmail toolFuc

    if data?
      yield put 
        type: type.save
        payload: {
          users:data
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'verUserEmail error'

    return

  resetUserPsdWithEmail: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.resetUserPsdWithEmail toolFuc
    ,
      payload.data

    if data?
      yield put 
        type: type.save
        payload: {
          users:data
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'resetUserPsdWithEmail error'

    return
  
  resetUserPsd: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.resetUserPsd toolFuc
    ,
      payload.data

    if data?
      yield put 
        type: type.save
        payload: {
          users:data
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'resetUserPsd error'

    return
  
  updateUserInfo: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.updateUserInfo toolFuc
    ,
      payload.data

    if data?
      yield put 
        type: type.save
        payload: {
          users:data
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'updateUserInfo error'

    return

  resetUserSessionToken: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.resetUserSessionToken toolFuc
    ,
      payload.data

    if data?
      yield put 
        type: type.save
        payload: {
          users: data
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'resetUserSessionToken error'

    return
  
  deleteUser: (
    { payload }
    { put }
  ) ->
    data = yield services.lc.deleteUser toolFuc
    ,
      payload.data

    if data?
      yield put 
        type: type.save
        payload: {
          users: data
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'deleteUser error'

    return
  
  refreshToken: (
    { payload }
    { put }
  ) ->
    yield put 
      type: type.save
      payload: {
        users: payload.data
      }

    return