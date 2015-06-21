if srv then
  srv.close(srv)
end

tmr.alarm(0, 1000, 1, function()
   if wifi.sta.getip() == nil then
      print("Connecting to AP...")
   else
      print('IP: ',wifi.sta.getip())
      tmr.stop(0)
   end
end)

-- A simple http server
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
  conn:on("receive",function(conn,payload)
    local response
    -- TODO: make this compliant with RFC 2616
    print('received paypload',payload)
    if string.find(payload,'GET /index.html HTTP/1.1') then
      local getroot=require("getroot")
      getroot(conn)
      getroot=nil
      package.loaded["getroot"]=nil
    elseif string.find(payload,'GET /events HTTP/1.1') then
      local getsse=require("getsse")
      getsse(conn)
      getsse=nil
      package.loaded["getsse"]=nil
    else
      print('returning method not allowed')
      response = 
[[HTTP/1.1 405 Method not allowed
Content-Type: text/plain

Method not allowed
]]
      conn:send(response)

      conn:on("sent",function(conn) 
        print('closing HTTP connection on method not allowed',conn)
        conn:close() 
      end)
    end

  end)
end)

