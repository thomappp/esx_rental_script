MainMenu = RageUI.CreateMenu("Location", "Vehicules");
SelectedLocation = 0

function RageUI.PoolMenus:CreatorMenu()
    MainMenu:IsVisible(function(Items)

		for i = 1, #Config.Locations[SelectedLocation].Vehicles do
			local vehicle = Config.Locations[SelectedLocation].Vehicles[i]

			Items:AddButton(vehicle.label, nil, { IsDisabled = false, RightLabel = ("%s$"):format(vehicle.price) }, function(onSelected)
				if (onSelected) then
					local canSpawn, coords, heading = CanVehicleSpawn(SelectedLocation)

					if canSpawn then
						SpawnVehicle(vehicle, coords, heading)
					else
						ShowNotification("~y~Quelque chose semble bloquer la sortie du véhicule.")
					end
				end
			end)
		end

	end, function()
	end)
end