local moduleName = 'getsse'
_G[moduleName] = function(conn)
  response = 
[[HTTP/1.1 200 OK
Content-Type: application/json

]]
  --start the SSE stream
  print('node.heap',node.heap())
  local dht
  local h
  local t
  local humi
  local temp
  local fare
  dht=require("dht")
  dht.read(4)
  chck=1
  h=dht.getHumidity()
  t=dht.getTemperature()
  if h==nil then h=0 chck=0 end
  humi=h/256
  temp=t/256
  fare=(temp*9/5+32)
  print("Humidity:    "..humi.."%")
  print("Temperature: "..temp.." deg C")
  print("Temperature: "..fare.." deg F")
  -- release module
  dht=nil
  package.loaded["dht"]=nil
  payload = response .. 
            'data: {"humidity":' .. 
            string.format('%d',humi) .. 
            ',"temperature" : ' ..  
            string.format('%d',temp) .. '}\n\n'
  print('sending data payload',payload)
  conn:send(payload)

  conn:on("sent",function(conn) 
    print('closing HTTP connection on 200 OK', conn)
    conn:close() 
  end)
end

return _G[moduleName]

