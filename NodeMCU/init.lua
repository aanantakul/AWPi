-- Global Variables (Modify your network)
ssid  = "true_homewifi_69f" 
pass = "5t2hjtuk"
 
 -- Configure Wireless Internet
 wifi.setmode(wifi.STATION)
 print('Set Mode = STATION (mode = '..wifi.getmode()..')\n')
 print('MAC Address: ', wifi.sta.getmac())
 print('Chip ID:         ', node.chipid())
 print('Heap Size:      ', node.heap())

 -- wifi config
 wifi.sta.config(ssid , pass)
 
tmr.alarm(0, 3000, 1, function()
   ip, nm, gw=wifi.sta.getip()
   if ip=="0.0.0.0" or ip==nil then
      print('CONNECTING TO ACCESS POINT . . .') 
   else
      tmr.stop(0)
      print('NETWORK CONNECTED !!!\nIP INFO:')
      print("  > IP Address: "..ip.." \n  > Netmask:    "..nm.." \n  > Gateway:    "..gw.."\n")
      print('\'driveSSR.lua\' IS RUNNING . . .') 
      dofile("driveSSR.lua")
   end
end)