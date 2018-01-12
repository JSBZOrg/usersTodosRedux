import config from './config'
import getUserService from './users'

lc = 
  signup: (getUserService config.lc.users).signup
  login: (getUserService config.lc.users).login
  fetch: (getUserService config.lc.users).fetch
  fetchAll: (getUserService config.lc.users).fetchAll
  verEmail: (getUserService config.lc.users).verEmail
  resetPsdWithEmail: (getUserService config.lc.users).resetPsdWithEmail
  resetPsd: (getUserService config.lc.users).resetPsd
  update: (getUserService config.lc.users).update
  resetSessionToken: (getUserService config.lc.users).resetSessionToken
  delete: (getUserService config.lc.users).delete

local =
  signup: (getUserService config.local.users).signup
  login: (getUserService config.local.users).login
  fetch: (getUserService config.local.users).fetch
  fetchAll: (getUserService config.local.users).fetchAll
  verEmail: (getUserService config.local.users).verEmail
  resetPsdWithEmail: (getUserService config.local.users).resetPsdWithEmail
  resetPsd: (getUserService config.local.users).resetPsd
  update: (getUserService config.local.users).update
  resetSessionToken: (getUserService config.local.users).resetSessionToken
  delete: (getUserService config.local.users).delete

export {
  lc
  local
}
  
    
  

