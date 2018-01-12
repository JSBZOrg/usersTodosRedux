import dd from 'ddeyes'
import toolFuc from '../../../src/utils/helper'
import * as services from '../../../src/services/users'

signup = (username, password, phoneNo) =>
  data = await services.lc.signup toolFuc
  ,
    username: username
    password: password
    phoneNo: phoneNo
  data

login = (username, password) =>
  data = await services.lc.login toolFuc
  ,
    username: username
    password: password
  data

fetch = (objectId) =>
  data = await services.lc.fetch toolFuc
  ,
    objectId: objectId
  data

fetchAll = =>
  data = await services.lc.fetchAll toolFuc
  data

verEmail = (email) =>
  data = await services.lc.verEmail toolFuc
  ,
    eamil: eamil
  data

resetPsdWithEmail = (email, password) =>
  data = await services.lc.resetPsdWithEmail toolFuc
  ,
    eamil: eamil
    password: password
  data

resetPsd = (objectId, sessionToken, old_password, new_password) =>
  data = await services.lc.resetPsd toolFuc
  ,
    objectId: objectId
    sessionToken: sessionToken
    old_password: old_password
    new_password: new_password
  data

update = (objectId, sessionToken, username, password, phoneNo) =>
  data = await services.lc.update toolFuc
  ,
    objectId: objectId
    sessionToken: sessionToken
    username: username
    password: password
    phoneNo: phoneNo
  data

resetSessionToken = (objectId, sessionToken) =>
  data = await services.lc.resetSessionToken toolFuc
  ,
    objectId: objectId
    sessionToken: sessionToken
  data

deleteUser = (objectId, sessionToken) =>
  data = await services.lc.delete toolFuc
  ,
    objectId: objectId
    sessionToken: sessionToken
  data

deleteAll =  =>
  results = 
  ids = fetchAll().results.reduce (r, c) =>
    [
      r...
      c.objectId
    ]
  , []
  for id in ids
    data = await services.lc.delete toolFuc
    ,
      objectId: id
      sessionToken: sessionToken
    data

export {
  signup
  login
  fetch
  fetchAll
  verEmail
  resetPsdWithEmail
  resetPsd
  update
  resetSessionToken
  deleteUser
}