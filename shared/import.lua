local CoreObj, FObj = exports['id_core']:GetCoreObject()
Core = CoreObj

_FRAMEWORK = FObj.Name
_FVERSION = FObj.Version

if FObj.Name == 'ESX' then
    ESX = FObj.Libary
    if not IsDuplicityVersion() then
        if FObj.Version >= 1.6 then
            AddEventHandler('esx:setPlayerData', function(key, val, last)
                if GetInvokingResource() == 'es_extended' then
                    ESX.PlayerData[key] = val
                    if OnPlayerData ~= nil then OnPlayerData(key, val, last) end
                end
            end)
        elseif FObj.Version == 1.1 or FObj.Version == 1.2 then
            CreateThread(function()
                while ESX == nil do
                    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                    Wait(0)
                end
            
                while ESX.GetPlayerData().job == nil do
                    Wait(10)
                end
            
                ESX.PlayerData = ESX.GetPlayerData()
            end)
            RegisterNetEvent('esx:setJob', function(job)
                ESX.PlayerData.job = job
            end)
        end
    end
elseif FObj.Name == 'QBCORE' then
    QBCore = FObj.Libary
end