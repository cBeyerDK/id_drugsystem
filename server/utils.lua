Utils = Utils or {}

function Utils:canSwapItems(src, itemData, otherItems)
    if _FRAMEWORK == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(src)

        if _FVERSION >= 1.6 then
            local invWeight = xPlayer.getWeight()
            local maxWeight = xPlayer.getMaxWeight()

            local xItem = xPlayer.getInventoryItem(itemData[1])
            invWeight = invWeight + xItem.weight * itemData[2]

            for k,v in pairs(otherItems) do
                local xItem = xPlayer.getInventoryItem(v[1])
                invWeight = invWeight - xItem.weight * v[2]
            end

            return invWeight <= maxWeight
        elseif _FVERSION == 1.1 or _FVERSION == 1.2 then
            return true
        end
    elseif _FRAMEWORK == 'QBCORE' then
        return true
    else
        Core.Utils:Print('nil-func', 'Utils:canSwapItems')
        --[[
            Funktionen skal return en boolean
        ]]
    end
end

function Utils:getInventoryItem(src, itemName)
    if _FRAMEWORK == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(src)
        
        return xPlayer.getInventoryItem(itemName)
    elseif _FRAMEWORK == 'QBCORE' then
        local ply = QBCore.Functions.GetPlayer(src)
        local invItem = ply.Functions.GetItemByName(itemName)

        return {
            name = invItem.name,
            label = invItem.label,
            count = invItem.amount
        }
    else
        Core.Utils:Print('nil-func', 'Utils:getInventoryItem')
        --[[
            Funktionen skal return et table der indeholder:
                label = 'itemLabel',
                name = itemName,
                count = 1
        ]]
    end
end

function Utils:canCarryItem(src, itemName, count)
    if _FRAMEWORK == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(src)

        if _FVERSION >= 1.6 then
            return xPlayer.canCarryItem(itemName, count)
        elseif _FVERSION == 1.1 or _FVERSION == 1.2 then
            local xItem = xPlayer.getInventoryItem(itemName)

            return xItem.limit == -1 or xItem.count + count <= xItem.limit
        end
    elseif _FRAMEWORK == 'QBCORE' then
        local ply = QBCore.Functions.GetPlayer(src)
        local plyWeight = QBCore.Player.GetTotalWeight(ply.PlayerData.items)
        local invItem = QBCore.Shared.Items[itemName]

        return plyWeight + (invItem.weight * count) <= QBCore.Config.Player.MaxWeight
    else
        Core.Utils:Print('nil-func', 'Utils:canCarryItem')
        --[[
            Funktionen skal return en boolean
        ]]
    end
end

function Utils:addInventoryItem(src, itemName, amount)
    if _FRAMEWORK == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.addInventoryItem(itemName, amount)
    elseif _FRAMEWORK == 'QBCORE' then
        local ply = QBCore.Functions.GetPlayer(src)
        ply.Functions.AddItem(itemName, amount)
    else
        Core.Utils:Print('nil-func', 'Utils:addInventoryItem')
        --[[
            Funktionen skal tilføje et item til spillerens inventar
        ]]
    end
end

function Utils:removeInventoryItem(src, itemName, amount)
    if _FRAMEWORK == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.removeInventoryItem(itemName, amount)
    elseif _FRAMEWORK == 'QBCORE' then
        local ply = QBCore.Functions.GetPlayer(src)
        ply.Functions.RemoveItem(itemName, amount)
    else
        Core.Utils:Print('nil-func', 'Utils:removeInventoryItem')
        --[[
            Funktionen skal fjerne et item fra spillerens inventar
        ]]
    end
end

function Utils:GetItemLabel(itemName)
    if _FRAMEWORK == 'ESX' then
        return ESX.GetItemLabel(itemName)
    elseif _FRAMEWORK == 'QBCORE' then
        return QBCore.Shared.Items[itemName].label
    else
        Core.Utils:Print('nil-func', 'Utils:GetItemLabel')
        --[[
            Funktionen skal return item label på et item
        ]]
    end
end