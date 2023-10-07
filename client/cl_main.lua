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
								
				ESX.TriggerServerCallback('esx_rental_car:buy', function(success, money)
				    if success then
					ESX.Game.SpawnVehicle(GetHashKey(vehicle.model), coords, heading, function()
					    ESX.ShowNotification(("Vous avez loué le véhicule ~g~%s~s~."):format(vehicle.label), true)
					end)
				    else
	   				ESX.ShowNotification(("Il vous manque ~r~%s$~s~ pour louer ce véhicule."):format(money), true)
				    end
			        end, SelectedLocation, i)
			    else
				ESX.ShowNotification("Quelque chose semble obstruer la porte du garage.", true)
			    end
			end
		    end)
		end
			
	end, function()
	end)
end
