
ESX = nil
local cached_players = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerDropped', function (reason)
    local pCoords = GetEntityCoords(GetPlayerPed(source))
    cached_players[source] = {res = reason, name = GetPlayerName(source), coords = pCoords}
    TriggerClientEvent("utils:playerDisconnect", -1, source, {res = reason, name = GetPlayerName(source), pos = pCoords})
    eLogsDiscord("[Disconnect] **"..xPlayer.getName().." a déco la raison est : "..reason, Config.logs.exit)
end)

---------------- LOGS
function eLogsDiscord(message,url)
    local DiscordWebHook = url
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({username = Config.logs.NameLogs, content = message}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('eExit:logsEvent')
AddEventHandler('eExit:logsEvent', function(message, url)
	eLogsDiscord(message,url)
end)
