

--car
function SpawnCar(model)
    local car = GetHashKey(model)
    RequestModel(car)
    local vehicle = CreateVehicle(car, 1207.8, 341.32, 81.0 + 1, true, false)

    local ped = GetPlayerPed(-1)
    SetPedIntoVehicle(ped, vehicle, -1)

end

RegisterNetEvent("RM:SpawnCar")
AddEventHandler("RM:SpawnCar", function() 
    SpawnCar("Blazer2")

    SetVehicleDoorsLocked(vehicle, 4)

    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        multiline = true,
        args = {"2 minutes to ride"}
    })

    Wait(120 * 1000)

    DeleteVehicle(vehicle)

    SetEntityCoords(PlayerPedId(), 1207.8, 341.32, 81.2, true, false, false, true)

    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        multiline = true,
        args = {"thanks for visit"}
    })

end)

--Marker entry point
Citizen.CreateThread(function()
    while true do
        Wait(5)
        DrawMarker( 43, 1207.8, 341.32, 81.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 31, 58, 147, 100, false, false, 2, true, nil, nil, false)
    
        local playerCoord = GetEntityCoords(PlayerPedId(), false)
        local MarkerCoords = vector3(1207.8, 341.32, 81.0)
        
        if Vdist2(playerCoord, MarkerCoords) < 2.0*1.12 then
            if IsControlJustPressed(1, 38) then 
                TriggerEvent("RM:SpawnCar")
            end
        end
    end
end)

--blip
Citizen.CreateThread(function()

    local coords = vector3(1207.8, 341.32, 81)
    local sprite = 127
    local scale = 1.2
    local color = 46

	while true do
		local blip = AddBlipForCoord(coords)

		SetBlipSprite(blip, sprite)
		SetBlipScale(blip, scale)
		SetBlipColour(blip, color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('Motokary'))
		EndTextCommandSetBlipName(blip)
	end
end)