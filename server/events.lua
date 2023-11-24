local AC = exports['id_core']:getACUtils()
local playerLoadEvent = 'id_core:playerLoaded'
if Core.Settings.Framework.Name == 'ESX' then playerLoadEvent = 'esx:playerLoaded' end

--==================
--==    Fields    ==
--==================
RegisterNetEvent('id_drugsystem:field:startFieldTimer', function(data, eventCode)
    local src = source

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    startFieldTimer(src, data)
end)

RegisterNetEvent('id_drugsystem:field:startWaterTimer', function(locKey, time, eventCode)
    local src = source

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    startWaterTimer(src, locKey, time)
end)

RegisterNetEvent('id_drugsystem:field:harvestPlant', function(locKey, drugName, data, eventCode)
    locKey = tostring(locKey)
    local src = source

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    local xItem = Utils:getInventoryItem(src, Config.Crop.drugs[drugName].items.product)
    local canCarryAmount = 0

    for i=1, data.surviveAmount, 1 do
        if not Utils:canCarryItem(src, xItem.name, i) then
            canCarryAmount = i - 1
            break
        end

        canCarryAmount = i
    end

    if canCarryAmount > 0 then
        Utils:addInventoryItem(src, xItem.name, canCarryAmount)
        if canCarryAmount == data.surviveAmount then
            playerFields[src][locKey] = nil
            TriggerClientEvent('id_drugsystem:field:removePlant', src, locKey)
        else
            local newSeeds = data.surviveAmount - canCarryAmount
            newSeeds = newSeeds / data.surviveProcent
            newSeeds = math.floor(newSeeds / playerFields[src][locKey].productPerSeed)
            playerFields[src][locKey].seedAmount = newSeeds
            TriggerClientEvent('id_drugsystem:field:updateSeedAmount', src, locKey, newSeeds)
        end
    else
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('no_item_space', 1, xItem.label),
            type = 'error'
        })
    end
end)

RegisterNetEvent('id_drugsystem:field:removePlant', function(locKey, eventCode)
    locKey = tostring(locKey)
    local src = source

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    playerFields[src][locKey] = nil
    TriggerClientEvent('id_drugsystem:field:removePlant', src, locKey)
end)

RegisterNetEvent('id_drugsystem:field:setCropFertilized', function(locKey, eventCode)
    locKey = tostring(locKey)
    local src = source

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    playerFields[src][locKey].fertilized = true    
end)

AddEventHandler(playerLoadEvent, function(src, cPlayer)
    exports.oxmysql:query('SELECT * FROM id_drugsystem WHERE identifier = ?', {cPlayer.identifier}, function(data)
        if data and data[1] then
            local DATA = json.decode(data[1].data)
            if DATA then
                TriggerClientEvent('id_drugsystem:field:loadPlayer', src, DATA)
                for k,v in pairs(DATA) do
                    v.location = vector3(v.location.x, v.location.y, v.location.z)
                    startFieldTimer(src, v)
                    if v.timeToNextWater > 0 then
                        startWaterTimer(src, v.locKey, v.timeToNextWater, true)
                    end
                end
            end
        end
    end)
end)

AddEventHandler('id_core:playerDropped', function(src, cPlayer)
    local data = exports.oxmysql:query_async('SELECT * FROM id_drugsystem WHERE identifier = ?', {cPlayer.identifier})
    if data and data[1] then
        exports.oxmysql:update('UPDATE id_drugsystem SET data = ? WHERE identifier = ?', {json.encode(playerFields[src]), cPlayer.identifier})
    else
        if playerFields[src] then
            exports.oxmysql:insert('INSERT INTO id_drugsystem (identifier, data) VALUES (?,?)', {cPlayer.identifier, json.encode(playerFields[src])})
        end
    end

    playerFields[src] = nil
end)

--====================
--==    Cleaning    ==
--====================
RegisterNetEvent('id_drugsystem:cleaning:start', function(locKey, product, eventCode)
    local src = source

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    if not playersCleaning[src] then startCleaning(src, locKey, product) end
end)

RegisterNetEvent('id_drugsystem:cleaning:stopPlayer', function(eventCode)
    local src = source

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    if playersCleaning[src] then
        stopCleaning(src)
    end
end)

--===================
--==    Packing    ==
--===================
RegisterNetEvent('id_drugsystem:packing:start', function(locKey, product, eventCode)
    local src = source

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    if not playersPacking[src] then startPacking(src, locKey, product) end
end)

RegisterNetEvent('id_drugsystem:packing:stopPlayer', function(eventCode)
    local src = source

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    if playersPacking[src] then
        stopPacking(src)
    end
end)