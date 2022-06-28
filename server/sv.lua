ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('xTeleport:checkitem', function(source, cb, select)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end
    if (xPlayer.getInventoryItem(select.ItemName).count) > 0 then cb(true) else cb(false) end
end)