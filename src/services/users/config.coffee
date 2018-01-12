export default config = do =>
  header = 
    users: do =>
      base = 
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      {
        base
      }
    
  baseUri =
    lc_uri: "https://xy1g1vfw.api.lncld.net/1.1"
    local_uri: "http://192.168.0.192:7001"
  
  users = 
    # 注册
    signup:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/users?fetchWhenSave=true"
        local: =>
          "#{baseUri.local_uri}/users"
      method: 'POST'      
    
    # 登录(userName password为登录凭据)
    login:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/login"
        local: =>
          "#{baseUri.local_uri}/login"
      method: 'POST'
    
    # 查找单个用户信息
    fetch:
      headers: header.users.base
      uri:
        lc: (objectId) =>
          "#{baseUri.lc_uri}/users/#{objectId}"
        local: (objectId) =>
          "#{baseUri.local_uri}/users/#{objectId}"
      method: 'GET'
    
    # 列举所有用户信息
    fetchAll:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/users"
        local: =>
          "#{baseUri.local_uri}/users"
      method: 'GET'
    
    # 验证用户邮箱
    verEmail:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/requestEmailVerify"
        local: =>
          "#{baseUri.local_uri}/requestEmailVerify"
      method: 'POST'

    # 用户重置密码(通过邮箱重设密码传入参为Email)
    resetPsdWithEmail:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/requestPasswordReset"
        local: =>
          "#{baseUri.local_uri}/requestPasswordReset"
      method: 'POST'

    # 用户修改密码(和上面的区别是下面的修改密码先输入旧密码才能修改密码)
    resetPsd:
      headers: (data) ->
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
        'X-LC-Session': "#{data.sessionToken}"
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/users/#{data.objectId}/updatePassword"
        local: (data) =>
          "#{baseUri.local_uri}/#{data.objectId}/updatePassword"
      method: 'PUT'

    # 用户更新个人信息
    update:
      headers: (data) ->
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
        'X-LC-Session': "#{data.sessionToken}"
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/users/#{data.objectId}?fetchWhenSave=true"
        local: (data) =>
          "#{baseUri.local_uri}/users/#{data.objectId}?fetchWhenSave=true"
      method: 'PUT'
    
    # 重置用户的sessionToken(用户更改密码之后强制更换token)
    resetSessionToken:
      headers: (data) ->
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
        'X-LC-Session': "#{data.sessionToken}"
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/users/#{data.objectId}/refreshSessionToken"
        local: (data) =>
          "#{baseUri.local_uri}/users/#{data.objectId}/refreshSessionToken"
      method: 'PUT'

    # 删除用户
    delete:
      headers: (data) ->
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
        'X-LC-Session': "#{data.sessionToken}"
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/users/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/users/#{data.objectId}"
      method: 'DELETE'
    
  # leancloud
  lc:
    users:
      signup:
        uri: users.signup.uri.lc
        headers: users.signup.headers
        method: users.signup.method
      
      login:
        uri: users.login.uri.lc
        headers: users.login.headers
        method: users.login.method

      fetch:
        uri: users.fetch.uri.lc
        headers: users.fetch.headers
        method: users.fetch.method
      
      fetchAll:
        uri: users.fetchAll.uri.lc
        headers: users.fetchAll.headers
        method: users.fetchAll.method
      
      verEmail:
        uri: users.verEmail.uri.lc
        headers: users.verEmail.headers
        method: users.verEmail.method
      
      resetPsdWithEmail:
        uri: users.resetPsdWithEmail.uri.lc
        headers: users.resetPsdWithEmail.headers
        method: users.resetPsdWithEmail.method

      resetPsd:
        uri: users.resetPsd.uri.lc
        headers: users.resetPsd.headers
        method: users.resetPsd.method
      
      update:
        uri: users.update.uri.lc
        headers: users.update.headers
        method: users.update.method
      
      resetSessionToken:
        uri: users.resetSessionToken.uri.lc
        headers: users.resetSessionToken.headers
        method: users.resetSessionToken.method
      
      delete:
        uri: users.delete.uri.lc
        headers: users.delete.headers
        method: users.delete.method
    
  # local
  local:
    users:
      signup:
        uri: users.signup.uri.local
        headers: users.signup.headers
        method: users.signup.method
      
      login:
        uri: users.login.uri.local
        headers: users.login.headers
        method: users.login.method

      fetch:
        uri: users.fetch.uri.local
        headers: users.fetch.headers
        method: users.fetch.method
      
      fetchAll:
        uri: users.fetchAll.uri.local
        headers: users.fetchAll.headers
        method: users.fetchAll.method
      
      verEmail:
        uri: users.verEmail.uri.local
        headers: users.verEmail.headers
        method: users.verEmail.method
      
      resetPsdWithEmail:
        uri: users.resetPsdWithEmail.uri.local
        headers: users.resetPsdWithEmail.headers
        method: users.resetPsdWithEmail.method

      resetPsd:
        uri: users.resetPsd.uri.local
        headers: users.resetPsd.headers
        method: users.resetPsd.method
      
      update:
        uri: users.update.uri.local
        headers: users.update.headers
        method: users.update.method
      
      resetSessionToken:
        uri: users.resetSessionToken.uri.local
        headers: users.resetSessionToken.headers
        method: users.resetSessionToken.method
      
      delete:
        uri: users.delete.uri.local
        headers: users.delete.headers
        method: users.delete.method

