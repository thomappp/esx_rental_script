ESX.RegisterServerCallback("esx_rental_car:buy", function(source, cb, SelectedLocation, SelectedVehicle)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Location = Config.Locations[SelectedLocation]
    local distance = #(Location.Spawner.coords - xPlayer.getCoords(true))

    if distance <= 3.0 then
        local price = Location.Vehicles[SelectedVehicle].price
        local xPlayerMoney = xPlayer.getMoney()

        if xPlayerMoney >= price then
            xPlayer.removeMoney(price)
            cb(true)
        else
            cb(false, price - xPlayerMoney)
        end
    else
        xPlayer.kick("Assurez vous de ne pas utiliser de cheat.")
    end
end)