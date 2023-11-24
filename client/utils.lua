Utils = Utils or {}

function Utils:playAnim(dict, name, time)
    local playerPed = PlayerPedId()

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end

    if time == -1 then
        TaskPlayAnim(playerPed, dict, name, 2.0, 2.0, time, 1, 0, false, false, false)
    else
        TaskPlayAnim(playerPed, dict, name, 2.0, 2.0, time, 0, 0, false, false, false)
    end
end