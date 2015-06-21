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

sensorType="dht11"             -- set sensor type dht11 or dht22
pin = 4 --  data pin, GPIO2
humi=0
temp=0
fare=0
bimb=1
--load DHT module for read sensor
function ReadDHT11()
    dht=require("dht")
    dht.read(pin)
    chck=1
    h=dht.getHumidity()
    t=dht.getTemperature()
    if h==nil then h=0 chck=0 end
    if sensorType=="dht11"then
        humi=h/256
        temp=t/256
    else
        humi=h/10
        temp=t/10
    end
    fare=(temp*9/5+32)
    print("Humidity:    "..humi.."%")
    print("Temperature: "..temp.." deg C")
    print("Temperature: "..fare.." deg F")
    -- release module
    dht=nil
    package.loaded["dht"]=nil
end
ReadDHT11()

-- A simple http server
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
  conn:on("receive",function(conn,payload)
    -- TODO: make this compliant with RFC 2616
    print('received paypload',payload)
    if string.find(payload,'GET / HTTP/1.1') or string.find(payload,'GET /index.html HTTP/1.1') then
      print('serving index.html', indexLength)

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

    elseif string.find(payload,'GET /events HTTP/1.1') then
      response = 
[[HTTP/1.1 200 OK
Content-Type: text/event-stream
Cache-Control: no-cache
Connection: keep-alive


]]
      conn:send(response)
      --start the SSE stream
      print('start the SSE stream')
      tmr.alarm(1, 1000, 1, function()
        ReadDHT11()
        payload = 'data: {"humidity":' .. 
                  string.format('%d',humi) .. 
                  ',"temperature" : ' ..  
                  string.format('%d',temp) '}\n\n'
        print('sending data payload',payload)
        conn:send(payload)
      end)

      conn:on("disconnection",function(conn,payload)
        print('disconnect. stop the timer')
        tmr.stop(1)   --stop the timer
      end)
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

