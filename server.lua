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
    print(payload)
    conn:send("<h1> Hello, NodeMcu.</h1>")
  end)
  conn:on("sent",function(conn) conn:close() end)
end)

