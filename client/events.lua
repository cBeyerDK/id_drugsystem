RegisterNetEvent('id_drugsystem:field:updateGrowthTime', function(locKey, timeLeft)
    locKey = tonumber(locKey)
    for k,v in pairs(playerFields) do
        if v.locKey == locKey then
            playerFields[k].timeToNextState = timeLeft
            break
        end
    end
end)

RegisterNetEvent('id_drugsystem:field:updateGrowthState', function(locKey, growthState, timeLeft)
    locKey = tonumber(locKey)
    for k,v in pairs(playerFields) do
        if v.locKey == locKey then
            playerFields[k].growthState = growthState
            playerFields[k].timeToNextState = timeLeft
            if growthState == Config.Crop.fertilizeState then
                createFertilizeTarget(locKey)
            elseif growthState == Config.Crop.fertilizeState + 1 then
                exports['fivem-target']:RemoveTargetPoint("id_drugsystem:field:fertilize:"..locKey)
            end

            if growthState == #Config.Crop.growthStates - 1 then
                createHarvetTarget(locKey)
            end

            break
        end
    end
end)

RegisterNetEvent('id_drugsystem:field:updateWaterTime', function(locKey, timeLeft)
    locKey = tonumber(locKey)
    for k,v in pairs(playerFields) do
        if v.locKey == locKey then
            playerFields[k].timeToNextWater = timeLeft
            break
        end
    end
end)

RegisterNetEvent('id_drugsystem:field:updateSeedAmount', function(locKey, amount)
    locKey = tonumber(locKey)
    for k,v in pairs(playerFields) do
        if v.locKey == locKey then
            playerFields[k].seedAmount = amount
            break
        end
    end
end)

RegisterNetEvent('id_drugsystem:field:removePlant', function(locKey)
    locKey = tonumber(locKey)
    for k,v in pairs(playerFields) do
        if v.locKey == locKey then
            exports['fivem-target']:RemoveTargetPoint("id_drugsystem:planted:"..v.drugName..':'..locKey)
            table.remove(playerFields, k)
            break
        end
    end

    -- Create field again
    local options = {}
    for i=1, #Config.Field.locations[locKey].drugs, 1 do
        table.insert(options, {
            name = Config.Field.locations[locKey].drugs[i],
            label = _U(Config.Field.locations[locKey].drugs[i])
        })
    end

    exports["fivem-target"]:AddTargetPoint({
        name = "id_drugsystem:field:"..locKey,
        label = _U('FT:field:plant:label'),
        icon = "fas fa-seedling",
        point = Config.Field.locations[locKey].pos,
        interactDist = 1.2,
        onInteract = FT_plantSeed,
        options = options,
        vars = {
            key = locKey
        }
    })
end)


RegisterNetEvent('id_drugsystem:field:loadPlayer', function(data)
    for key,value in pairs(data) do
        if type(value) == 'table' then
            value.location = vector3(value.location.x, value.location.y, value.location.z)
            exports['fivem-target']:RemoveTargetPoint("id_drugsystem:field:"..value.locKey)
            table.insert(playerFields, value)
            local locKey = value.locKey
            local drugName = value.drugName
            
            if value.growthState == #Config.Crop.growthStates - 1 or value.growthState == #Config.Crop.growthStates then
                createHarvetTarget(locKey)
            else
                exports["fivem-target"]:AddTargetPoint({
                    name = "id_drugsystem:planted:"..drugName..':'..locKey,
                    label = _U('FT:field:planted:label', _U(drugName)),
                    icon = "fas fa-cannabis",
                    point = value.location,
                    interactDist = 1.2,
                    onInteract = function(_, optionName, vars)
                        local dataKey, data
                        for k,v in pairs(playerFields) do
                            if v.locKey == vars.locKey then
                                dataKey, data = k,v
                                break
                            end
                        end

                        local growthState = data.growthState
                        if growthState == #Config.Crop.growthStates - 1 then
                            growthState = _U('field:harvest:ready')
                        elseif growthState == #Config.Crop.growthStates then
                            growthState = _U('field:harvest:withered')
                        end

                        if optionName == 'getStatus' then
                            if _FRAMEWORK == 'ESX' then
                                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'field_plant_status', {
                                    title = _U('field:status:title'),
                                    align = 'left',
                                    elements = {
                                        {label = '<b>Plante:</b> '.._U(data.drugName)},
                                        {label = '<b>Frø:</b> '..data.seedAmount},
                                        {label = '<b>Stadie:</b> '..growthState},
                                        {label = '<b>Næste Stadie:</b> '..data.timeToNextState..' minut(ter)'},
                                        {label = '<b>Vandet:</b> '..data.waterLevel..'/'..#Config.Crop.waterMultiplier},
                                        {label = '<b>Gødet:</b> '..((data.fertilized and _U('yes')) or _U('no'))}
                                    }
                                }, function(data, menu) end, function(data, menu)
                                    menu.close()
                                end)
                            else
                                TriggerEvent('chat:addMessage', {args = {'^1[DRUGS]^7', '^*Plante:^r '.._U(data.drugName)}})
                                TriggerEvent('chat:addMessage', {args = {'^1[DRUGS]^7', '^*Frø:^r '..data.seedAmount}})
                                TriggerEvent('chat:addMessage', {args = {'^1[DRUGS]^7', '^*Stadie:^r '..growthState}})
                                TriggerEvent('chat:addMessage', {args = {'^1[DRUGS]^7', '^*Næste Stadie:^r '..data.timeToNextState..' minut(ter)'}})
                                TriggerEvent('chat:addMessage', {args = {'^1[DRUGS]^7', '^*Vandet:^r '..data.waterLevel..'/'..#Config.Crop.waterMultiplier}})
                                TriggerEvent('chat:addMessage', {args = {'^1[DRUGS]^7', '^*Gødet:^r '..((data.fertilized and _U('yes')) or _U('no'))}})
                            end
                        elseif optionName == 'water' then
                            if data.timeToNextWater == 0 then
                                if data.waterLevel < #Config.Crop.waterMultiplier then
                                    ESX.TriggerServerCallback('id_drugsystem:hasItem', function(hasItem, itemLabel)
                                        if hasItem then
                                            playerFields[dataKey].waterLevel = data.waterLevel + 1
                                            playerFields[dataKey].timeToNextWater = Config.Crop.waterTime
                                            exports['id_notify']:notify({
                                                message = _U('field:wateredPlant', playerFields[dataKey].waterLevel, #Config.Crop.waterMultiplier),
                                                type = 'success'
                                            })
                                            TriggerServerEvent('id_drugsystem:field:startWaterTimer', locKey, playerFields[dataKey].timeToNextWater, serverEventCode)
                                        else
                                            exports['id_notify']:notify({
                                                message = _U('no_item', itemLabel),
                                                type = 'error'
                                            })
                                        end
                                    end, Config.Crop.waterItem, 1, true)
                                else
                                    exports['id_notify']:notify({
                                        message = _U('field:maxWater'),
                                        type = 'error'
                                    })
                                end
                            else
                                exports['id_notify']:notify({
                                    message = _U('field:water_at', data.timeToNextWater),
                                    type = 'info'
                                })
                            end
                        end
                    end,
                    options = {
                        {label = _U('FT:field:getStatus'), name = 'getStatus'},
                        {label = _U('FT:field:water'), name = 'water'}
                    },
                    vars = {
                        drugName = drugName,
                        locKey = locKey
                    }
                })

                if value.growthState == Config.Crop.fertilizeState then
                    createFertilizeTarget(locKey)
                end
            end
        end
    end
end)

--====================
--==    Cleaning    ==
--====================
RegisterNetEvent('id_drugsystem:cleaning:stop', function()
    exports['id_helpnotify']:hideUI()
    isCleaning = false
    exports['progressBars']:stopUI()
    showPromp = true
    FreezeEntityPosition(PlayerPedId(), false)
end)

--===================
--==    Packing    ==
--===================
RegisterNetEvent('id_drugsystem:packing:stop', function()
    exports['id_helpnotify']:hideUI()
    isPacking = false
    exports['progressBars']:stopUI()
    showPromp = true
    FreezeEntityPosition(PlayerPedId(), false)
end)