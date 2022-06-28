ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)

--

Citizen.CreateThread(function()
    while true do
        local wait = 1000

        for i = 1, #Teleport do
            local select = Teleport[i]

            for k,v in pairs(select.Position_marker) do
                local pos = select.Position_marker
                local pPos = GetEntityCoords(PlayerPedId())
                local dst = Vdist(pPos.x, pPos.y, pPos.z, pos[k].x, pos[k].y, pos[k].z)

                if dst <= Teleport.MarkerDistance then
                    wait = 0
                    DrawMarker(Teleport.MarkerType, pos[k].x, pos[k].y, pos[k].z - 0.99, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Teleport.MarkerSizeLargeur, Teleport.MarkerSizeEpaisseur, Teleport.MarkerSizeHauteur, Teleport.MarkerColorR, Teleport.MarkerColorG, Teleport.MarkerColorB, Teleport.MarkerOpacite, Teleport.MarkerSaute, true, p19, Teleport.MarkerTourne)
                end

                if dst <= 1.0 then
                    wait = 0
                    ESX.ShowHelpNotification(select.Message)
                    if IsControlJustPressed(1, 51) then
                        if select.ItemRequired == true then 
                            ESX.TriggerServerCallback('xTeleport:checkitem', function(have) 
                                if have then
                                    if select.ItemAnim == true then
                                        local dict = "anim@mp_player_intmenu@key_fob@"
                                        RequestAnimDict(dict)
                                        while not HasAnimDictLoaded(dict) do
                                            Citizen.Wait(0)
                                        end
                                        TaskPlayAnim(GetPlayerPed(-1), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
                                        Wait(2000)
                                    else
                                        ESX.Game.Teleport(PlayerPedId(), select.Destination, function()end)
                                    end
                                else
                                    ESX.ShowNotification(select.ItemMessageErreur)
                                end
                            end, select)
                        elseif select.JobRequired == true then
                            if ESX.PlayerData.job and ESX.PlayerData.job.name == select.JobName then
                                if select.GradeRequired == true then 
                                    for k,v in pairs(select.gradeName) do
                                        if ESX.PlayerData.job.grade_name == v then
                                            ESX.Game.Teleport(PlayerPedId(), select.Destination, function()end)
                                        else
                                            ESX.ShowNotification(select.GradeMessageErreur)
                                        end
                                    end
                                else
                                    ESX.Game.Teleport(PlayerPedId(), select.Destination, function()end)
                                end
                            else
                                ESX.ShowNotification(select.JobMessageErreur)
                            end
                        elseif select.Job2Required == true then
                            if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == select.Job2Name then
                                if select.Grade2Required == true then 
                                    for k,v in pairs(select.grade2Name) do
                                        if ESX.PlayerData.job2.grade_name == v then
                                            ESX.Game.Teleport(PlayerPedId(), select.Destination, function()end)
                                        else
                                            ESX.ShowNotification(select.Grade2MessageErreur)
                                        end
                                    end
                                else
                                    ESX.Game.Teleport(PlayerPedId(), select.Destination, function()end)
                                end
                            else
                                ESX.ShowNotification(select.Job2MessageErreur)
                            end
                        else
                            ESX.Game.Teleport(PlayerPedId(), select.Destination, function()end)
                        end                    
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

--- Xed#1188