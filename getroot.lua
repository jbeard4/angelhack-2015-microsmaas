local moduleName = 'getroot'
_G[moduleName] = function(conn)
  response = 
[[HTTP/1.1 200 OK
Content-Type: text/html

]]

  conn:send(response)
  file.open('index.html')
  local s = file.read()
  while s do
    conn:send(s)
    s = file.read()
  end  
  file.close()

  conn:on("sent",function(conn) 
    print('closing HTTP connection on 200 OK', conn)
    conn:close() 
  end)
end

return _G[moduleName]

