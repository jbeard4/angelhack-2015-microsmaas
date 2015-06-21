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
    print('received paypload',payload)
    response = 
[[HTTP/1.1 200 OK
Content-Type: text/event-stream
Cache-Control: no-cache
Connection: keep-alive


]]
    conn:send(response)


    --start the SSE stream
    tmr.alarm(1, 1000, 1, function()
      payload = "data: " .. string.format("%.3f", math.random()) .. "\n\n"
      conn:send(payload)
    end)
  end)

  conn:on("disconnection",function(conn,payload)
    print('disconnect. stop the timer')
    tmr.stop(1)   --stop the timer
  end)

end)

