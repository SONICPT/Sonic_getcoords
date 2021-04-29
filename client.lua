ESX                           = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('Sonic_pegarcoords')
AddEventHandler('Sonic_pegarcoords', function()
    local player = GetPlayerPed(-1)
    local playercoords = GetEntityCoords(player)
    local w = GetEntityHeading(GetPlayerPed(-1))
    local coord = "{x = "..round(playercoords.x,2)..",  y = "..round(playercoords.y,2)..",  z = "..round(playercoords.z,2)..", h = "..round(w,2).."},"
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'codemenu',
        {
          title = "Name"
        },
        function(data, menu)
            local name = data.value
            TriggerServerEvent('Sonic_pegarcoords:print', name.." : "..coord)
            menu.close()
        end,
      function(data, menu)
        menu.close()
      end)
    
end)

RegisterNetEvent('Sonic_pegarcoords1')
AddEventHandler('Sonic_pegarcoords1', function()
    local player = GetPlayerPed(-1)
    local playercoords = GetEntityCoords(player)
    local w = GetEntityHeading(GetPlayerPed(-1))
    local coord = round(playercoords.x,2)..", "..round(playercoords.y,2)..", "..round(playercoords.z,2)..", " ..round(w,2)
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'codemenu',
        {
          title = "Name"
        },
        function(data, menu)
            local name = data.value
            TriggerServerEvent('Sonic_pegarcoords:print', name.." : "..coord)
            menu.close()
        end,
      function(data, menu)
        menu.close()
      end)
end)

function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end