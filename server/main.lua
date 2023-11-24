serverEventCode = '3a3Hc5hvBHU$fqsS$m8XW=v4m#--6P2kCGpnPvrPKAnZkmC6CGSsXJmPZEmbTS37GQKLmz6Fm_V^LT3&#BdDvzdbj_vg*9VBUJ-G=afVLkKybB^-nWKe*H?!J!$4D--PW?tS^&529@uFsM_Z+aQ%=tr6aBav4pHz2vmKF&Y#JQ$PPM4sc7ku?QL=hg^T?_WkU?2-%#6Dh?5Y2__?SAgMX#3ktnR!8JaMXV76f2U-Ukz8@_k!u-X3xzBD!T6jD36_&&Agu@+gA$gsTL84!SVVdyEpQtWfKYkR_f&%@uUSPqnc2n5cuDB%MYhzzayVxbb*hxM&H8!!m_Q!wNVqS9Q9am*qg*&!B3Q=QmQQ5Chnw72A3+B@HeMEqA4+33a?Y4KXQ$-rk=Mtecgm^z9&C$uMw+*vmVD3P-jM7-2q$^nMBMcb+ab_Mvn?_m#X-6jnsfxn9%yDtC$T_TyR_t**2U4Dct+hxH#z_T5mR6a3_M*3$#S8Yvg*!Ph8g64w4pzFDk65P5Cu#HmTzLrKYw^97+4ykv4ZrKZ6%r^k677KU@*g^q7-M@HVTZbcv$+NdyRF5C7HR3pztY%-77ukQ$p?FEg%aQT*zbfR!qR5$9WEEGmFLmTb8^MdgPX7npf=kvTCTn=YMm4HNGNE3Vx2Dvz+gb_uhjxvwJs@@Ew8V2sb^BFc*+EVd8A5+5Kx7jJ5RNqQJmSCWvT^PkeF55rEqsus?*dyC=XMRQ&FdWmk_zK*FQHbmY7ex_SGT@7Qyv4$uXA+@BvRHt5tGNt6cmy&tYB^!Z526*=ZP=+m532PbcQZ79h5h^fVjEgjPHJHME?8J6$NpjbdqU!xf%2BS3e9tdBr29-kQy@U_km5%N6LAzwZ&Lt%j^bd75zS62Vg6MBbE^3k&bCUD?p%tS!nhG+5XpDAtbDBEF-^x49#NGau_&!J7qdKFjzS4^HbZ4APYr$+MgN?8NCVmEcb5FBj3cbj=aBRjkGaY=qz6Bb#vHSPbLXBk6knn?8w$J-a?Bc-X8zz$+LCkaJUWyxG+?DBL*8n2_aN6Z%XJ&TNNt!5rRwBW!gyux=$UNZTdH@GCqKy2zT^*zjQtrHPZ?EYheHPs5FkU+AbnBWMRg9sE=bXwFXwNd&=_Ncb$csZhd!vewUg%kUUfEBCRd#jVzkm9UhvLn@&^w=_M9SXnx-Z*XXkHkp!GLPg^4rDQqWv-3SZeu*3!dpmrk-SJ+4dh!HveEyw_9ZNsrpuF*5#aQfuaYp2aDxr?*&Q&^+WgUH@%pmY6&s_Yj%RGg!L^4^ewJxmp$ph-*p=Y6s8RrW6CsMy^zEeMnp$rU2Y-mCFGEpB&*L*9_4_=N&zma@GF?bqN$-X*KdyFfnsu!*_3^2^Nbe3&rswzedm5%kBdfKpjAgsxr$C^pDp4S?yt6+N-Z!*#^39bpktAx$_Zu!Xd5&wW=WumPw3VQ!WBLC_=526AfPeJunZUgzxbLEnf9B5g$rRAqbhCj_35Es!_5A%^XTNt8qp6sMZkkvX74=J-?4h#L*6JDU!wM*dJdNDWr$xR*+qP%wvw2tnVMEmhW^VcAWL$FZupfn!WjY2J5Kxhr^y#Zh$e$9b-bu8GEHjAR%LK*r^rh9CUxHf#MT83Pg6g@RjRbArMbdgAS3F!BQ3Jze4V%G=M9E+Kebf*s!VwHvAV^Tt*Fgr_&&s+8daTauE_cF*qzkc*ddkMn^UBmB@tb!PsjkNDV?-xgP7FwR#jYTYB2uCa!qk*%wg#GXcMV=jCr5hB$GzBH-xp?kh22S%V-?5N94t5Nq^JKkw+@Bktnx6=RgVd+svZ^K8uyj7BJvf*!EXKeHG29?Xjp+8rV5V9-fgXCF5$KfRSbefc9a2x5gCA2r@VCmSSHzkdbw&wJt4h!%X-s9MW9HHCExdh-?DGYjVzU-H$QS-RY9ptE6eRMzKa5xz*3x^V^%9bm@r3RMJ$nqA=D2352CH2YxP7T$J%2s8y-UG*5Ku&NLhX#WHHP!%7FzxnY4*=@9BBGM_S5h_F%Gwf$%rK#k**9mNu6KNzRBvSAa=rEbY@FBAB=9gj3uc9!-v'

--========================
--==    Config Checks   ==
--========================
if #Config.Crop.growthStates < 3 then
    Core.Utils:Print('err', 'Der skal minimum være ^13^7 stadier til planterne!')
    StopResource(GetCurrentResourceName())
    return
end

--====================
--==    Variables   ==
--====================
playerFields = {}
playersCleaning, playersCleaningTimeout = {}, {}
playersPacking, playersPackingTimeout = {}, {}

--==================
--==    Fields    ==
--==================
Core.Utils:RegisterServerCallback('id_drugsystem:field:getItemAmount', function(src, cb, itemName)
    local xItem = Utils:getInventoryItem(src, itemName)

    if xItem then
        cb(xItem.count, xItem.label)
    else
        cb(0)
    end
end)

Core.Utils:RegisterServerCallback('id_drugsystem:field:plantSeed', function(src, cb, itemName, seedAmount)
    local xItem = Utils:getInventoryItem(src, itemName)

    if xItem.count >= seedAmount or true then
        Utils:removeInventoryItem(src, xItem.name, seedAmount)
        cb(true)
    else
        cb(false)
    end
end)

Core.Utils:RegisterServerCallback('id_drugsystem:hasItem', function(src, cb, itemName, amount, removeItem)
    local xItem = Utils:getInventoryItem(src, itemName)

    if amount and amount > 0 then
        if xItem.count >= amount then
            if removeItem then Utils:removeInventoryItem(src, xItem.name, amount) end
            cb(true, xItem.label)
        else
            cb(false, xItem.label)
        end
    else
        cb(xItem.count > 0, xItem.label)
    end
end)

function startFieldTimer(src, data)
    if playerFields[src] then
        playerFields[src][tostring(data.locKey)] = data
    else
        playerFields[src] = {}

        playerFields[src][tostring(data.locKey)] = data
    end

    Citizen.CreateThread(function()
        local src = src
        local locKey = tostring(data.locKey)
        while playerFields[src][locKey].timeToNextState > 0 do
            Wait(60 * 1000)
            if not playerFields[src] or not playerFields[src][locKey] then break end
            playerFields[src][locKey].timeToNextState = playerFields[src][locKey].timeToNextState - 1
            if playerFields[src][locKey].timeToNextState > 0 then
                TriggerClientEvent('id_drugsystem:field:updateGrowthTime', src, locKey, playerFields[src][locKey].timeToNextState)
            else
                playerFields[src][locKey].growthState = playerFields[src][locKey].growthState + 1
                if playerFields[src][locKey].growthState < #Config.Crop.growthStates then
                    playerFields[src][locKey].timeToNextState = Config.Crop.growthStates[playerFields[src][locKey].growthState + 1]
                    TriggerClientEvent('id_drugsystem:field:updateGrowthState', src, locKey, playerFields[src][locKey].growthState, playerFields[src][locKey].timeToNextState)
                else
                    TriggerClientEvent('id_drugsystem:field:updateGrowthState', src, locKey, playerFields[src][locKey].growthState, 0)
                end
            end
        end
    end)
end

function startWaterTimer(src, locKey, time, fromSQL)
    locKey = tostring(locKey)
    playerFields[src][locKey].timeToNextWater = time

    if not fromSQL then playerFields[src][locKey].waterLevel = playerFields[src][locKey].waterLevel + 1 end

    Citizen.CreateThread(function()
        local src = src
        local locKey = locKey
        while playerFields[src][locKey].timeToNextWater > 0 do
            Wait(60 * 1000)
            if not playerFields[src] or not playerFields[src][locKey] then break end
            playerFields[src][locKey].timeToNextWater = playerFields[src][locKey].timeToNextWater - 1
            TriggerClientEvent('id_drugsystem:field:updateWaterTime', src, locKey, playerFields[src][locKey].timeToNextWater)
        end
    end)
end

--====================
--==    Cleaning    ==
--====================
function startCleaning(src, locKey, productName)
    local product = Config.Crop.drugs[productName]
    local xItem = Utils:getInventoryItem(src, product.items.product)
    local outItem = product.items.cleaned
    local extraItems = {}
    if #product.cleaning.items > 0 then
        for k,v in pairs(product.cleaning.items) do
            table.insert(extraItems, {
                itemName = v.itemName,
                amount = v.amount,
                xItem = Utils:getInventoryItem(src, v.itemName)
            })
        end
    end

    if xItem.count >= product.cleaning.minItems then
        playersCleaning[src] = true
        if #extraItems > 0 then
            Citizen.CreateThread(function()
                local time = product.cleaning.time * 1000
                local hasExtraItems = 0
                local extraSwapItems = {}
                for k,v in pairs(extraItems) do
                    if v.xItem.count >= v.amount then
                        hasExtraItems = hasExtraItems + 1
                        table.insert(extraSwapItems, {v.itemName, v.amount})
                    end
                end

                while playersCleaning[src] do
                    Wait(10)
                    if not playersCleaningTimeout[src] then
                        playersCleaningTimeout[src] = Core.Utils:SetTimeout(time, function()
                            xItem = Utils:getInventoryItem(src, product.items.product)
                            hasExtraItems = 0
                            extraSwapItems = {}
                            for k,v in pairs(extraItems) do
                                if v.xItem.count >= v.amount then
                                    hasExtraItems = hasExtraItems + 1
                                    table.insert(extraSwapItems, {v.itemName, v.amount})
                                end
                            end
                            if xItem.count >= product.cleaning.minItems and hasExtraItems == #extraItems then
                                if Utils:canSwapItems(src, {outItem, product.cleaning.cleanedItems}, extraSwapItems) then
                                    Utils:removeInventoryItem(src, xItem.name, product.cleaning.minItems)
                                    for k,v in pairs(extraItems) do
                                        Utils:removeInventoryItem(src, v.itemName, v.amount)
                                        v.xItem = Utils:getInventoryItem(src, v.itemName)
                                    end
                                    Utils:addInventoryItem(src, outItem, product.cleaning.cleanedItems)
                                    xItem = Utils:getInventoryItem(src, product.items.product)
                                    hasExtraItems = 0
                                    extraSwapItems = {}
                                    for k,v in pairs(extraItems) do
                                        if v.xItem.count >= v.amount then
                                            hasExtraItems = hasExtraItems + 1
                                            table.insert(extraSwapItems, {v.itemName, v.amount})
                                        end
                                    end
                                else
                                    TriggerClientEvent('id_notify:notify', src, {
                                        message = _U('cleaning:not_enough_space'),
                                        type = 'error'
                                    })
                                    stopCleaning(src)
                                end
                            else
                                local str = product.cleaning.minItems..'x '..xItem.label
                                for k,v in pairs(product.cleaning.items) do
                                    if k == #product.cleaning.items then
                                        str = str..' og '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                                    else
                                        str = str..', '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                                    end
                                end
                                TriggerClientEvent('id_notify:notify', src, {
                                    message = _U('cleaning:not_enough_items', str),
                                    type = 'info'
                                })
                                stopCleaning(src)
                            end

                            playersCleaningTimeout[src] = nil
                        end)
                    elseif xItem.count >= product.cleaning.minItems and hasExtraItems == #extraItems then
                        Wait(time)
                    elseif not Utils:canSwapItems(src, {outItem, product.cleaning.cleanedItems}, extraSwapItems) then
                        TriggerClientEvent('id_notify:notify', src, {
                            message = _U('cleaning:not_enough_space'),
                            type = 'error'
                        })
                        stopCleaning(src)
                    else
                        local str = product.cleaning.minItems..'x '..xItem.label
                        for k,v in pairs(product.cleaning.items) do
                            if k == #product.cleaning.items then
                                str = str..' og '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                            else
                                str = str..', '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                            end
                        end
                        TriggerClientEvent('id_notify:notify', src, {
                            message = _U('cleaning:not_enough_items', str),
                            type = 'info'
                        })
                        stopCleaning(src)
                    end
                end
            end)
        else
            Citizen.CreateThread(function()
                local time = product.cleaning.time * 1000

                while playersCleaning[src] do
                    Wait(10)
                    if not playersCleaningTimeout[src] then
                        playersCleaningTimeout[src] = Core.Utils:SetTimeout(time, function()
                            xItem = Utils:getInventoryItem(src, product.items.product)
                            if xItem.count >= product.cleaning.minItems then
                                if Utils:canSwapItems(src, {outItem, product.cleaning.cleanedItems}, {{xItem.name, product.cleaning.minItems}}) then
                                    Utils:removeInventoryItem(src, xItem.name, product.cleaning.minItems)
                                    Utils:addInventoryItem(src, outItem, product.cleaning.cleanedItems)
                                    xItem = Utils:getInventoryItem(src, product.items.product)
                                else
                                    TriggerClientEvent('id_notify:notify', src, {
                                        message = _U('cleaning:not_enough_space'),
                                        type = 'error'
                                    })
                                    stopCleaning(src)
                                end
                            else
                                local str = product.cleaning.minItems..'x '..xItem.label
                                TriggerClientEvent('id_notify:notify', src, {
                                    message = _U('cleaning:not_enough_items'),
                                    type = 'info'
                                })
                                stopCleaning(src)
                            end
                        end)
                    elseif xItem.count >= product.cleaning.minItems then
                        Wait(time)
                    elseif not Utils:canSwapItems(src, {outItem, product.cleaning.cleanedItems}, {{xItem.name, product.cleaning.minItems}}) then
                        TriggerClientEvent('id_notify:notify', src, {
                            message = _U('cleaning:not_enough_space'),
                            type = 'error'
                        })
                        stopCleaning(src)
                    else
                        local str = product.cleaning.minItems..'x '..xItem.label
                        TriggerClientEvent('id_notify:notify', src, {
                            message = _U('cleaning:not_enough_items', str),
                            type = 'info'
                        })
                        stopCleaning(src)
                    end
                end
            end)
        end
    else
        stopCleaning(src)
        if #extraItems > 0 then
            local str = product.cleaning.minItems..'x '..xItem.label
            for k,v in pairs(product.cleaning.items) do
                if k == #product.cleaning.items then
                    str = str..' og '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                else
                    str = str..', '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                end
            end
            TriggerClientEvent('id_notify:notify', src, {
                message = _U('cleaning:not_enough_items', str),
                type = 'info'
            })
        else
            local str = product.cleaning.minItems..'x '..xItem.label
            TriggerClientEvent('id_notify:notify', src, {
                message = _U('cleaning:not_enough_items', str),
                type = 'info'
            })
        end
    end
end

function stopCleaning(src)
    if playersCleaningTimeout[src] then
        Core.Utils:ClearTimeout(playersCleaningTimeout[src])
        playersCleaningTimeout[src] = nil
    end

    playersCleaning[src] = nil
    TriggerClientEvent('id_drugsystem:cleaning:stop', src)
end

Core.Utils:RegisterServerCallback('id_drugsystem:cleaning:selectProduct', function(src, cb, products)
    for k,v in pairs(products) do
        if Utils:getInventoryItem(src, Config.Crop.drugs[v].items.cleaned).product > 0 then
            cb(v)
            return
        end
    end

    cb(nil)
end)

--===================
--==    Packing    ==
--===================
function startPacking(src, locKey, productName)
    local product = Config.Crop.drugs[productName]
    local xItem = Utils:getInventoryItem(src, product.items.cleaned)
    local outItem = product.items.packed
    local extraItems = {}
    if #product.packing.items > 0 then
        for k,v in pairs(product.packing.items) do
            table.insert(extraItems, {
                itemName = v.itemName,
                amount = v.amount,
                xItem = Utils:getInventoryItem(src, v.itemName)
            })
        end
    end

    if xItem.count >= product.packing.minItems then
        playersPacking[src] = true
        if #extraItems > 0 then
            Citizen.CreateThread(function()
                local time = product.packing.time * 1000
                local hasExtraItems = 0
                local extraSwapItems = {}
                for k,v in pairs(extraItems) do
                    if v.xItem.count >= v.amount then
                        hasExtraItems = hasExtraItems + 1
                        table.insert(extraSwapItems, {v.itemName, v.amount})
                    end
                end

                while playersPacking[src] do
                    Wait(10)
                    if not playersPackingTimeout[src] then
                        playersPackingTimeout[src] = Core.Utils:SetTimeout(time, function()
                            xItem = Utils:getInventoryItem(src, product.items.cleaned)
                            hasExtraItems = 0
                            extraSwapItems = {}
                            for k,v in pairs(extraItems) do
                                if v.xItem.count >= v.amount then
                                    hasExtraItems = hasExtraItems + 1
                                    table.insert(extraSwapItems, {v.itemName, v.amount})
                                end
                            end
                            if xItem.count >= product.packing.minItems and hasExtraItems == #extraItems then
                                if Utils:canSwapItems(src, {outItem, product.packing.packedItems}, extraSwapItems) then
                                    Utils:removeInventoryItem(src, xItem.name, product.packing.minItems)
                                    for k,v in pairs(extraItems) do
                                        Utils:removeInventoryItem(src, v.itemName, v.amount)
                                        v.xItem = Utils:getInventoryItem(src, v.itemName)
                                    end
                                    Utils:addInventoryItem(src, outItem, product.packing.packedItems)
                                    xItem = Utils:getInventoryItem(src, product.items.cleaned)
                                    hasExtraItems = 0
                                    extraSwapItems = {}
                                    for k,v in pairs(extraItems) do
                                        if v.xItem.count >= v.amount then
                                            hasExtraItems = hasExtraItems + 1
                                            table.insert(extraSwapItems, {v.itemName, v.amount})
                                        end
                                    end
                                else
                                    TriggerClientEvent('id_notify:notify', src, {
                                        message = _U('packing:not_enough_space'),
                                        type = 'error'
                                    })
                                    stopPacking(src)
                                end
                            else
                                local str = product.packing.minItems..'x '..xItem.label
                                for k,v in pairs(product.packing.items) do
                                    if k == #product.packing.items then
                                        str = str..' og '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                                    else
                                        str = str..', '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                                    end
                                end
                                TriggerClientEvent('id_notify:notify', src, {
                                    message = _U('packing:not_enough_items', str),
                                    type = 'info'
                                })
                                stopPacking(src)
                            end

                            playersPackingTimeout[src] = nil
                        end)
                    elseif xItem.count >= product.packing.minItems and hasExtraItems == #extraItems then
                        Wait(time)
                    elseif not Utils:canSwapItems(src, {outItem, product.packing.packedItems}, extraSwapItems) then
                        TriggerClientEvent('id_notify:notify', src, {
                            message = _U('packing:not_enough_space'),
                            type = 'error'
                        })
                        stopPacking(src)
                    else
                        local str = product.packing.minItems..'x '..xItem.label
                        for k,v in pairs(product.packing.items) do
                            if k == #product.packing.items then
                                str = str..' og '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                            else
                                str = str..', '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                            end
                        end
                        TriggerClientEvent('id_notify:notify', src, {
                            message = _U('packing:not_enough_items', str),
                            type = 'info'
                        })
                        stopPacking(src)
                    end
                end
            end)
        else
            Citizen.CreateThread(function()
                local time = product.packing.time * 1000

                while playersPacking[src] do
                    Wait(10)
                    if not playersPackingTimeout[src] then
                        playersPackingTimeout[src] = Core.Utils:SetTimeout(time, function()
                            xItem = Utils:getInventoryItem(src, product.items.cleaned)
                            if xItem.count >= product.packing.minItems then
                                if Utils:canSwapItems(src, {outItem, product.packing.packedItems}, {{xItem.name, product.packing.minItems}}) then
                                    Utils:removeInventoryItem(src, xItem.name, product.packing.minItems)
                                    Utils:addInventoryItem(src, outItem, product.packing.packedItems)
                                    xItem = Utils:getInventoryItem(src, product.items.cleaned)
                                else
                                    TriggerClientEvent('id_notify:notify', src, {
                                        message = _U('packing:not_enough_space'),
                                        type = 'error'
                                    })
                                    stopPacking(src)
                                end
                            else
                                local str = product.packing.minItems..'x '..xItem.label
                                TriggerClientEvent('id_notify:notify', src, {
                                    message = _U('packing:not_enough_items'),
                                    type = 'info'
                                })
                                stopPacking(src)
                            end
                        end)
                    elseif xItem.count >= product.packing.minItems then
                        Wait(time)
                    elseif not Utils:canSwapItems(src, {outItem, product.packing.packedItems}, {{xItem.name, product.packing.minItems}}) then
                        TriggerClientEvent('id_notify:notify', src, {
                            message = _U('packing:not_enough_space'),
                            type = 'error'
                        })
                        stopPacking(src)
                    else
                        local str = product.packing.minItems..'x '..xItem.label
                        TriggerClientEvent('id_notify:notify', src, {
                            message = _U('packing:not_enough_items', str),
                            type = 'info'
                        })
                        stopPacking(src)
                    end
                end
            end)
        end
    else
        stopPacking(src)
        if #extraItems > 0 then
            local str = product.packing.minItems..'x '..xItem.label
            for k,v in pairs(product.packing.items) do
                if k == #product.packing.items then
                    str = str..' og '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                else
                    str = str..', '..v.amount..'x '..Utils:GetItemLabel(v.itemName)
                end
            end
            TriggerClientEvent('id_notify:notify', src, {
                message = _U('packing:not_enough_items', str),
                type = 'info'
            })
        else
            local str = product.packing.minItems..'x '..xItem.label
            TriggerClientEvent('id_notify:notify', src, {
                message = _U('packing:not_enough_items', str),
                type = 'info'
            })
        end
    end
end

function stopPacking(src)
    if playersPackingTimeout[src] then
        Core.Utils:ClearTimeout(playersPackingTimeout[src])
        playersPackingTimeout[src] = nil
    end

    playersPacking[src] = nil
    TriggerClientEvent('id_drugsystem:packing:stop', src)
end

Core.Utils:RegisterServerCallback('id_drugsystem:packing:selectProduct', function(src, cb, products)
    for k,v in pairs(products) do
        if Utils:getInventoryItem(src, Config.Crop.drugs[v].items.cleaned).count > 0 then
            cb(v)
            return
        end
    end

    cb(nil)
end)