Citizen.CreateThread(function()
    for i = 1, #Config.Locations do

        local spawn = Config.Locations[i].Spawner
        local blip = AddBlipForCoord(spawn.coords)

        SetBlipSprite(blip, Config.Blip.sprite)
        SetBlipDisplay(blip, Config.Blip.display)
        SetBlipScale(blip, Config.Blip.scale)
        SetBlipColour(blip, Config.Blip.color)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Location véhicule")
        EndTextCommandSetBlipName(blip)

        local model = GetHashKey(spawn.model)

        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(0)
        end
        
        local ped = CreatePed(4, model, spawn.coords, spawn.heading, false, false)
        FreezeEntityPosition(ped, true)
        SetEntityAsMissionEntity(ped, true, true)  
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", -1, true)
    end

    while true do
        local playerWait = 500
        local playerZone = false

        for i = 1, #Config.Locations do
            local locationCoords = Config.Locations[i].Spawner.coords
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(playerCoords, locationCoords)
            
            if distance <= 1.5 then
                playerWait = 10
                playerZone = true

                if not RageUI.Visible(MainMenu) then

                    ShowHelpNotification(("Appuyez sur %s pour louer un véhicule."):format(Config.Control.controlName))

                    if IsControlJustReleased(0, Config.Control.controlId) then
                        SelectedLocation = i
                        RageUI.Visible(MainMenu, true)
                    end
                end
            end
        end

        if not playerZone and RageUI.Visible(MainMenu) then
            RageUI.Visible(MainMenu, false)
        end

        Citizen.Wait(playerWait)
    end
end)