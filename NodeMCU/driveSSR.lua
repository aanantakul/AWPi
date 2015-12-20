-- DRIVE 4CH SOLID STATE RELAY USING TIMER --
timerId = 0 
dly = 5000

-- SET GPIO FOR 4CH SOLID STATE RELAY --
SSR_CH1 = 0
SSR_CH2 = 1
SSR_CH3 = 2
SSR_CH4 = 3

-- SET MODE TO OUTPUT --
gpio.mode(SSR_CH1, gpio.OUTPUT)
gpio.mode(SSR_CH2, gpio.OUTPUT)
gpio.mode(SSR_CH3, gpio.OUTPUT)
gpio.mode(SSR_CH4, gpio.OUTPUT)
driveState = 0
ssrIndex = 0
SSR_INDEX = 0

-- INITIALIZE 4CH SOLID STATE RELAY --
gpio.write(SSR_CH1, 0)
gpio.write(SSR_CH2, 0)
gpio.write(SSR_CH3, 0)
gpio.write(SSR_CH4, 0)

 -- TIMER LOOP --
tmr.alarm( timerId, dly, 1, function()     
 if     ssrIndex == 0 then 
  SSR_INDEX = SSR_CH1
  driveState = 1
  ssrIndex = ssrIndex + 1
 elseif ssrIndex == 1 then 
  SSR_INDEX = SSR_CH1
  driveState = 0
  ssrIndex = ssrIndex + 1
 elseif ssrIndex == 2 then 
  SSR_INDEX = SSR_CH2
  driveState = 1
  ssrIndex = ssrIndex + 1
 elseif ssrIndex == 3 then 
  SSR_INDEX = SSR_CH2
  driveState = 0
  ssrIndex = ssrIndex + 1
 elseif ssrIndex == 4 then 
  SSR_INDEX = SSR_CH3
  driveState = 1
  ssrIndex = ssrIndex + 1
 elseif ssrIndex == 5 then 
  SSR_INDEX = SSR_CH3
  driveState = 0
  ssrIndex = ssrIndex + 1
 elseif ssrIndex == 6 then 
  SSR_INDEX = SSR_CH4
  driveState = 1
  ssrIndex = ssrIndex + 1
 elseif ssrIndex == 7 then 
  SSR_INDEX = SSR_CH4
  driveState = 0
  ssrIndex = ssrIndex + 1
 else ssrIndex = 0
 end

  gpio.write(SSR_INDEX, driveState)
end)