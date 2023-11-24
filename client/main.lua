serverEventCode = '3a3Hc5hvBHU$fqsS$m8XW=v4m#--6P2kCGpnPvrPKAnZkmC6CGSsXJmPZEmbTS37GQKLmz6Fm_V^LT3&#BdDvzdbj_vg*9VBUJ-G=afVLkKybB^-nWKe*H?!J!$4D--PW?tS^&529@uFsM_Z+aQ%=tr6aBav4pHz2vmKF&Y#JQ$PPM4sc7ku?QL=hg^T?_WkU?2-%#6Dh?5Y2__?SAgMX#3ktnR!8JaMXV76f2U-Ukz8@_k!u-X3xzBD!T6jD36_&&Agu@+gA$gsTL84!SVVdyEpQtWfKYkR_f&%@uUSPqnc2n5cuDB%MYhzzayVxbb*hxM&H8!!m_Q!wNVqS9Q9am*qg*&!B3Q=QmQQ5Chnw72A3+B@HeMEqA4+33a?Y4KXQ$-rk=Mtecgm^z9&C$uMw+*vmVD3P-jM7-2q$^nMBMcb+ab_Mvn?_m#X-6jnsfxn9%yDtC$T_TyR_t**2U4Dct+hxH#z_T5mR6a3_M*3$#S8Yvg*!Ph8g64w4pzFDk65P5Cu#HmTzLrKYw^97+4ykv4ZrKZ6%r^k677KU@*g^q7-M@HVTZbcv$+NdyRF5C7HR3pztY%-77ukQ$p?FEg%aQT*zbfR!qR5$9WEEGmFLmTb8^MdgPX7npf=kvTCTn=YMm4HNGNE3Vx2Dvz+gb_uhjxvwJs@@Ew8V2sb^BFc*+EVd8A5+5Kx7jJ5RNqQJmSCWvT^PkeF55rEqsus?*dyC=XMRQ&FdWmk_zK*FQHbmY7ex_SGT@7Qyv4$uXA+@BvRHt5tGNt6cmy&tYB^!Z526*=ZP=+m532PbcQZ79h5h^fVjEgjPHJHME?8J6$NpjbdqU!xf%2BS3e9tdBr29-kQy@U_km5%N6LAzwZ&Lt%j^bd75zS62Vg6MBbE^3k&bCUD?p%tS!nhG+5XpDAtbDBEF-^x49#NGau_&!J7qdKFjzS4^HbZ4APYr$+MgN?8NCVmEcb5FBj3cbj=aBRjkGaY=qz6Bb#vHSPbLXBk6knn?8w$J-a?Bc-X8zz$+LCkaJUWyxG+?DBL*8n2_aN6Z%XJ&TNNt!5rRwBW!gyux=$UNZTdH@GCqKy2zT^*zjQtrHPZ?EYheHPs5FkU+AbnBWMRg9sE=bXwFXwNd&=_Ncb$csZhd!vewUg%kUUfEBCRd#jVzkm9UhvLn@&^w=_M9SXnx-Z*XXkHkp!GLPg^4rDQqWv-3SZeu*3!dpmrk-SJ+4dh!HveEyw_9ZNsrpuF*5#aQfuaYp2aDxr?*&Q&^+WgUH@%pmY6&s_Yj%RGg!L^4^ewJxmp$ph-*p=Y6s8RrW6CsMy^zEeMnp$rU2Y-mCFGEpB&*L*9_4_=N&zma@GF?bqN$-X*KdyFfnsu!*_3^2^Nbe3&rswzedm5%kBdfKpjAgsxr$C^pDp4S?yt6+N-Z!*#^39bpktAx$_Zu!Xd5&wW=WumPw3VQ!WBLC_=526AfPeJunZUgzxbLEnf9B5g$rRAqbhCj_35Es!_5A%^XTNt8qp6sMZkkvX74=J-?4h#L*6JDU!wM*dJdNDWr$xR*+qP%wvw2tnVMEmhW^VcAWL$FZupfn!WjY2J5Kxhr^y#Zh$e$9b-bu8GEHjAR%LK*r^rh9CUxHf#MT83Pg6g@RjRbArMbdgAS3F!BQ3Jze4V%G=M9E+Kebf*s!VwHvAV^Tt*Fgr_&&s+8daTauE_cF*qzkc*ddkMn^UBmB@tb!PsjkNDV?-xgP7FwR#jYTYB2uCa!qk*%wg#GXcMV=jCr5hB$GzBH-xp?kh22S%V-?5N94t5Nq^JKkw+@Bktnx6=RgVd+svZ^K8uyj7BJvf*!EXKeHG29?Xjp+8rV5V9-fgXCF5$KfRSbefc9a2x5gCA2r@VCmSSHzkdbw&wJt4h!%X-s9MW9HHCExdh-?DGYjVzU-H$QS-RY9ptE6eRMzKa5xz*3x^V^%9bm@r3RMJ$nqA=D2352CH2YxP7T$J%2s8y-UG*5Ku&NLhX#WHHP!%7FzxnY4*=@9BBGM_S5h_F%Gwf$%rK#k**9mNu6KNzRBvSAa=rEbY@FBAB=9gj3uc9!-v'

--====================
--==    Variables   ==
--====================
playerFields = {}
showPromp, inMarker = true, nil
showPromp2, inMarker2 = true, nil
isCleaning, isPacking = false, false

--==================
--==    Fields    ==
--==================
Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k,v in pairs(Config.Field.locations) do
            local dist = GetDistanceBetweenCoords(playerCoords, v.pos, false)

            if dist <= Config.DrawDistance then
                sleep = 1
                DrawMarker(20, v.pos,
                0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 
                0.2, 0.2, 0.2,
                Config.MarkerColor[1], Config.MarkerColor[2], Config.MarkerColor[3], Config.MarkerColor[4],
                false, false, 2, false, nil, nil, false)
            end
        end

        Wait(sleep)
    end
end)


-- FiveM Target
Citizen.CreateThread(function()
    for k,v in pairs(Config.Field.locations) do
        local options = {}
        for i=1, #v.drugs, 1 do
            table.insert(options, {
                name = v.drugs[i],
                label = _U(v.drugs[i])
            })
        end

        exports["fivem-target"]:AddTargetPoint({
            name = "id_drugsystem:field:"..k,
            label = _U('FT:field:plant:label'),
            icon = "fas fa-seedling",
            point = v.pos,
            interactDist = 1.2,
            onInteract = FT_plantSeed,
            options = options,
            vars = {
                key = k
            }
        })
    end
end)

function FT_plantSeed(targetName,optionName,vars)
    if Config.Crop.drugs[optionName] then
        if #playerFields < Config.Field.maxFields then
            Core.Utils:TriggerServerCallback('id_drugsystem:field:getItemAmount', function(itemCount, itemLabel)
                if itemCount > 0 then
                    if _FRAMEWORK == 'ESX' then
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'field_seed_amount', {
                            title = _U('field:plantAmount', Config.Crop.drugs[optionName].maxSeeds),
                        }, function(data, menu)
                            if data.value and tonumber(data.value) then
                                local num = tonumber(data.value)
                                if num <= itemCount then
                                    if num <= Config.Crop.drugs[optionName].maxSeeds then
                                        menu.close()
                                        Core.Utils:TriggerServerCallback('id_drugsystem:field:plantSeed', function(plant) 
                                            if plant then
                                                plantSeed(optionName, num, vars.key)
                                            end
                                        end, Config.Crop.drugs[optionName].items.seed, num)
                                    else
                                        exports['id_notify']:notify({
                                            message = _U('field:too_much', num, Config.Crop.drugs[optionName].maxSeeds),
                                            type = 'error'
                                        })
                                    end
                                else
                                    exports['id_notify']:notify({
                                        message = _U('field:not_enough', num),
                                        type = 'error'
                                    })
                                end
                            else
                                exports['id_notify']:notify({
                                    message = _U('not_number'),
                                    type = 'error'
                                })
                            end
                        end, function(data, menu)
                            menu.close()
                        end)
                    else
                        local value = nil
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 200)
                        while UpdateOnscreenKeyboard() == 0 do
                            DisableAllControlActions(0)
                            Wait(0)
                        end

                        if GetOnscreenKeyboardResult() then
                            value = GetOnscreenKeyboardResult()
                        end

                        if not value or not tonumber(value) then
                            exports['id_notify']:notify({
                                message = _U('not_number'),
                                type = 'error'
                            })
                            return
                        end

                        value = tonumber(value)

                        if value > itemCount then
                            exports['id_notify']:notify({
                                message = _U('field:not_enough', value),
                                type = 'error'
                            })
                            return
                        end

                        if value > Config.Crop.drugs[optionName].maxSeeds then
                            exports['id_notify']:notify({
                                message = _U('field:too_much', value, Config.Crop.drugs[optionName].maxSeeds),
                                type = 'error'
                            })
                            return
                        end

                        Core.Utils:TriggerServerCallback('id_drugsystem:field:plantSeed', function(plant) 
                            if plant then plantSeed(optionName, value, vars.key) end
                        end, Config.Crop.drugs[optionName].items.seed, value)
                    end
                else
                    exports['id_notify']:notify({
                        message = _U('no_item', itemLabel),
                        type = 'error'
                    })
                end
            end, Config.Crop.drugs[optionName].items.seed)
        else
            exports['id_notify']:notify({
                message = _U('field:max_fields_active', Config.Field.maxFields),
                type = 'error'
            })
        end
    end
end


function plantSeed(drugName, seedAmount, locKey)
    exports['fivem-target']:RemoveTargetPoint("id_drugsystem:field:"..locKey)
    local fieldData = {
        drugName = drugName,
        seedAmount = seedAmount,
        productPerSeed = Config.Crop.drugs[drugName].productPerSeed,
        locKey = locKey,
        location = Config.Field.locations[locKey].pos,
        growthState = 0,
        timeToNextState = (Config.Crop.drugs[drugName].growTime ~= nil and Config.Crop.drugs[drugName].growTime) or Config.Crop.growthStates[1],
        waterLevel = 0,
        timeToNextWater = 0,
        fertilized = false,
        surviveProcent = Config.Crop.survive / 100,
    }

    Utils:playAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 3500)
    exports['progressBars']:startUI(3500, _U('field:progressBar:planting'))
    Wait(3500)

    table.insert(playerFields, fieldData)
    exports["fivem-target"]:AddTargetPoint({
        name = "id_drugsystem:planted:"..drugName..':'..locKey,
        label = _U('FT:field:planted:label', _U(drugName)),
        icon = "fas fa-cannabis",
        point = Config.Field.locations[locKey].pos,
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
                        Core.Utils:TriggerServerCallback('id_drugsystem:hasItem', function(hasItem, itemLabel)
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

    TriggerServerEvent('id_drugsystem:field:startFieldTimer', fieldData, serverEventCode)
end

function createFertilizeTarget(locKey)
    local dataKey, data
    for k,v in pairs(playerFields) do
        if v.locKey == locKey then
            dataKey, data = k,v
            break
        end
    end

    exports["fivem-target"]:AddTargetPoint({
        name = "id_drugsystem:field:fertilize:"..locKey,
        label = _U('FT:field:fertilize:label'),
        icon = "fas fa-plus-circle",
        point = data.location,
        interactDist = 1.2,
        onInteract = function(_, optionName, vars)
            if optionName == 'fertilize' then
                if not data.fertilized then
                    Core.Utils:TriggerServerCallback('id_drugsystem:hasItem', function(hasItem, itemLabel)
                        if hasItem then
                            playerFields[dataKey].fertilized = true
                            TriggerServerEvent('id_drugsystem:field:setCropFertilized', locKey, serverEventCode)
                            exports['id_notify']:notify({
                                message = _U('field:fertilized'),
                                type = 'error'
                            })
                        else
                            exports['id_notify']:notify({
                                message = _U('no_item', itemLabel),
                                type = 'error'
                            })
                        end
                    end, Config.Crop.fertilizeItem, 1, true)
                else
                    exports['id_notify']:notify({
                        message = _U('field:allreadyFertilized'),
                        type = 'error'
                    })
                end
            end
        end,
        options = {
            {label = _U('FT:field:fertilize'), name = 'fertilize'}
        },
        vars = {
            key = k
        }
    })
end

function createHarvetTarget(locKey)
    local dataKey, data
    for k,v in pairs(playerFields) do
        if v.locKey == locKey then
            dataKey, data = k,v
            break
        end
    end

    exports['fivem-target']:RemoveTargetPoint("id_drugsystem:planted:"..data.drugName..':'..locKey)

    exports["fivem-target"]:AddTargetPoint({
        name = "id_drugsystem:planted:"..data.drugName..':'..locKey,
        label = _U('FT:field:planted:label', _U(data.drugName)),
        icon = "fas fa-cannabis",
        point = Config.Field.locations[locKey].pos,
        interactDist = 1.2,
        onInteract = function(_, optionName, vars)
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
            elseif optionName == 'harvest' then
                if data.growthState == #Config.Crop.growthStates - 1 then
                    local a = {
                        surviveProcent = Config.Crop.survive / 100,
                        fertilizeMultiplier = 0.0,
                        waterMultiplier = 0.0,
                        productAmount = data.seedAmount * data.productPerSeed
                    }

                    if data.waterLevel > 0 then
                        a.waterMultiplier = Config.Crop.waterMultiplier[data.waterLevel] / 100
                        a.surviveProcent = a.waterMultiplier
                    end

                    if data.fertilized then
                        a.fertilizeMultiplier = Config.Crop.drugs[data.drugName].fertilizeMultiplier / 100
                        a.surviveProcent = a.surviveProcent + a.fertilizeMultiplier
                    end

                    a.surviveAmount = math.floor(a.productAmount * a.surviveProcent + 0.5)

                    Utils:playAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 3500)
                    exports['progressBars']:startUI(3500, _U('field:progressBar:harvest'))
                    Wait(3500)

                    TriggerServerEvent('id_drugsystem:field:harvestPlant', locKey, data.drugName, a, serverEventCode)
                else
                    exports['id_notify']:notify({
                        message = _U('field:plantWhitered'),
                        type = 'error'
                    })
                    TriggerServerEvent('id_drugsystem:field:removePlant', locKey, serverEventCode)
                end
            end
        end,
        options = {
            {label = _U('FT:field:getStatus'), name = 'getStatus'},
            {label = _U('FT:field:harvest'), name = 'harvest'}
        },
        vars = {
            locKey = locKey
        }
    })
end

--====================
--==    Cleaning    ==
--====================
Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k,v in pairs(Config.Cleaning.locations) do
            local dist = GetDistanceBetweenCoords(playerCoords, v.pos, false)

            if dist <= Config.DrawDistance then
                sleep = 1
                DrawMarker(25, v.pos,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                3.0, 3.0, 3.0,
                Config.MarkerColor[1], Config.MarkerColor[2], Config.MarkerColor[3], Config.MarkerColor[4],
                false, true, 2, false, nil, nil, false)

                if GetDistanceBetweenCoords(playerCoords, v.pos, true) <= 2.0 then
                    if showPromp then exports['id_helpnotify']:showUI(_U('cleaning:start:promp')) end
                    inMarker = k

                    if IsControlJustReleased(0, 51) then
                        if not isCleaning then
                            showPromp = false
                            exports['id_helpnotify']:hideUI()
                            if #v.products > 1 then
                                selectCleaningProduct(k,v)
                            else
                                startCleaning(k, v.products[1])
                            end
                            exports['id_helpnotify']:showUI(_U('cleaning:stop:promp'))
                        else
                            TriggerServerEvent('id_drugsystem:cleaning:stopPlayer', serverEventCode)
                            exports['id_helpnotify']:hideUI()
                        end
                    end
                elseif inMarker then
                    if _FRAMEWORK == 'ESX' then ESX.UI.Menu.CloseAll() end
                    if isCleaning then TriggerServerEvent('id_drugsystem:cleaning:stopPlayer', serverEventCode) end
                    exports['id_helpnotify']:hideUI()
                    showPromp = true
                    isCleaning = false
                    inMarker = nil
                end
            end
        end

        Wait(sleep)
    end
end)

function selectCleaningProduct(locKey, data)
    if _FRAMEWORK == 'ESX' then
        ESX.UI.Menu.CloseAll()

        local elements = {}

        for k,v in pairs(data.products) do
            table.insert(elements, {
                label = _U(v),
                value = v,
                key = k
            })
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cleaning_select_product', {
            title = _U('cleaning:select:title'),
            align = 'left',
            elements = elements
        }, function(data, menu)
            menu.close()
            startCleaning(locKey, data.current.value)
        end, function(data, menu)
            menu.close()
            showPromp = true
        end)
    else
        Core.Utils:TriggerServerCallback('id_drugsystem:cleaning:selectProduct', function(product)
            if product then startCleaning(locKey, product) end
        end, data.products)
    end
end

function startCleaning(locKey, product)
    if _FRAMEWORK == 'ESX' then ESX.UI.Menu.CloseAll() end

    FreezeEntityPosition(PlayerPedId(), true)
    isCleaning = true
    TriggerServerEvent('id_drugsystem:cleaning:start', locKey, product, serverEventCode)
    Citizen.CreateThread(function()
        local time = Config.Crop.drugs[product].cleaning.time * 1000
        while isCleaning do
            exports['progressBars']:startUI(time, _U('cleaning:progressBar'))
            Wait(time + 500)
        end
    end)
end

--===================
--==    Packing    ==
--===================
Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local access = true

        if Config.UsingGangSystem and Config.Packing.gangOnly then
            access = exports['id_gangsystem']:getGangData()
        end

        if access then
            for k,v in pairs(Config.Packing.locations) do
                local dist = GetDistanceBetweenCoords(playerCoords, v.pos, false)

                if dist <= Config.DrawDistance then
                    sleep = 1
                    DrawMarker(25, v.pos,
                    0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                    3.0, 3.0, 3.0,
                    Config.MarkerColor[1], Config.MarkerColor[2], Config.MarkerColor[3], Config.MarkerColor[4],
                    false, true, 2, false, nil, nil, false)

                    if GetDistanceBetweenCoords(playerCoords, v.pos, true) <= 1.5 then
                        if showPromp2 then exports['id_helpnotify']:showUI(_U('packing:start:promp')) end
                        inMarker2 = k

                        if IsControlJustReleased(0, 51) then
                            if not isPacking then
                                showPromp2 = false
                                exports['id_helpnotify']:hideUI()
                                if #v.products > 1 then
                                    selectPackingProduct(k,v)
                                else
                                    startPacking(k, v.products[1])
                                end
                                exports['id_helpnotify']:showUI(_U('packing:stop:promp'))
                            else
                                TriggerServerEvent('id_drugsystem:packing:stopPlayer', serverEventCode)
                                exports['id_helpnotify']:hideUI()
                            end
                        end
                    elseif inMarker2 then
                        if _FRAMEWORK == 'ESX' then ESX.UI.Menu.CloseAll() end
                        if isPacking then TriggerServerEvent('id_drugsystem:packing:stopPlayer', serverEventCode) end
                        exports['id_helpnotify']:hideUI()
                        showPromp2 = true
                        isPacking = false
                        inMarker2 = nil
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

function selectPackingProduct(locKey, data)
    if _FRAMEWORK == 'ESX' then
        ESX.UI.Menu.CloseAll()

        local elements = {}

        for k,v in pairs(data.products) do
            table.insert(elements, {
                label = _U(v),
                value = v,
                key = k
            })
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'packing_select_product', {
            title = _U('packing:select:title'),
            align = 'left',
            elements = elements
        }, function(data, menu)
            menu.close()
            startPacking(locKey, data.current.value)
        end, function(data, menu)
            menu.close()
            showPromp2 = true
        end)
    else
        Core.Utils:TriggerServerCallback('id_drugsystem:packing:selectProduct', function(product)
            if product then startPacking(locKey, product) end
        end, data.products)
    end
end

function startPacking(locKey, product)
    if _FRAMEWORK == 'ESX' then ESX.UI.Menu.CloseAll() end

    FreezeEntityPosition(PlayerPedId(), true)
    isPacking = true
    TriggerServerEvent('id_drugsystem:packing:start', locKey, product, serverEventCode)
    Citizen.CreateThread(function()
        local time = Config.Crop.drugs[product].packing.time * 1000
        while isPacking do
            exports['progressBars']:startUI(time, _U('packing:progressBar'))
            Wait(time + 500)
        end
    end)
end