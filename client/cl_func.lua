ShowNotification = function(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

ShowHelpNotification = function(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

IsSpawnPointClear = function(coords, radius)
    local vehicles = GetGamePool("CVehicle")
    local vehicleTbl = {}

    for i = 1, #vehicles do
        local vehicle = vehicles[i]
        local vehicleCoords = GetEntityCoords(vehicle)
        local distance = GetDistanceBetweenCoords(vehicleCoords, coords, true)

        if distance <= radius then
            table.insert(vehicleTbl, vehicle)
        end
    end

    return #vehicleTbl == 0
end

CanVehicleSpawn = function(LocationId)
    local Spawns = Config.Locations[LocationId].SpawnPoints
    local canSpawn, coords, heading = false, nil, 0

    for i = 1, #Spawns do
        if IsSpawnPointClear(Spawns[i].coords, Spawns[i].radius) then
            canSpawn, coords, heading = true, Spawns[i].coords, Spawns[i].heading
            break
        end
    end

    return canSpawn, coords, heading
end

SpawnVehicle = function(veh, coords, heading)
    Citizen.CreateThread(function()

        local model = GetHashKey(veh.model)

        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(0)
        end

        local vehicle = CreateVehicle(model, coords, heading, true, false)
        SetEntityAsMissionEntity(vehicle, true, false)
        SetModelAsNoLongerNeeded(model)
        SetVehRadioStation(vehicle, 'OFF')

        ShowNotification(("Vous avez loué le véhicule ~g~%s~s~."):format(veh.label))
    end)
end