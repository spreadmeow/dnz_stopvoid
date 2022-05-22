[[
--  _______  _______  _______  _______  _        _______  ______             _________ _______ 
--  (  ____ \(  ____ )(  ___  )(  ____ \| \    /\(  ____ \(  __  \   |\     /|\__   __/(  ____ \
--  | (    \/| (    )|| (   ) || (    \/|  \  / /| (    \/| (  \  )  | )   ( |   ) (   | (    \/
--  | |      | (____)|| (___) || |      |  (_/ / | (__    | |   ) |  | | _ | |   | |   | (__    
--  | |      |     __)|  ___  || |      |   _ (  |  __)   | |   | |  | |( )| |   | |   |  __)   
--  | |      | (\ (   | (   ) || |      |  ( \ \ | (      | |   ) |  | || || |   | |   | (      
--  | (____/\| ) \ \__| )   ( || (____/\|  /  \ \| (____/\| (__/  )_ | () () |   | |   | )      
--  (_______/|/   \__/|/     \|(_______/|_/    \/(_______/(______/(_)(_______)   )_(   |/    
--   
-- Wenn Karma zurückschlägt, sitze ich in der ersten Reihe und applaudiere, Karma hat kein Verfallsdatum.
--
]]
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
      local ped = PlayerPedId()
      local currentPos = GetEntityCoords(ped)
      local retval, groundZ = GetGroundZFor_3dCoord(currentPos.x, currentPos.y, currentPos.z, false)
      local dist = currentPos.z - groundZ
      if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsUsing(ped)
        local isheli = GetVehicleClass(vehicle)
        if isheli == 15 or isheli == 16 then
          return
        end
        if currentPos.z - groundZ > 500 or groundZ < 1 and currentPos.z > 50 then
          TriggerServerEvent("logdcdcdc",'User has been teleported to void', 'THIS IS BETA TESTING; REPORT ANY BUGS!')
          SetPedCoordsKeepVehicle(PlayerPedId(), myCoords.x, myCoords.y, myCoords.z)
        end
    end
  end
end)


Citizen.CreateThread(function()
  while true do
    local ped = PlayerPedId()
    Citizen.Wait(100)
    if IsPedInAnyVehicle(ped, false) then
      local currentPos = GetEntityCoords(ped)
      myCoords = GetEntityCoords(ped)
      Citizen.Wait(30000)
    end
  end
end)
