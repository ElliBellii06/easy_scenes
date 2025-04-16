local config = lib.load('shared')
local entities = {}

local function playScene(sceneData, animData)
    local ped = PlayerPedId()
    local scene = NetworkCreateSynchronisedScene(GetEntityCoords(ped), GetEntityRotation(ped), 2, false, false, 1.0, 0.0, 1.0)
    NetworkAddPedToSynchronisedScene(ped, scene, sceneData.dict, animData.player, 8.0, -8.0, 0, 0, 1000.0, 0)
    for i = 1, #entities do
        NetworkAddEntityToSynchronisedScene(entities[i], scene, sceneData.dict, animData.objects[i], 8.0, -8.0, 1)
    end
    NetworkStartSynchronisedScene(scene)
    Wait(animData.duration)
    -- Wait(GetAnimDuration(sceneData.dict, animData.player) * 1000) -- Doesn't work for some reason
end

local function setupScene(sceneData)
    local ped = PlayerPedId() 
    entities = {}

    for i = 1, #sceneData.objects do
        lib.requestModel(sceneData.objects[i])
        local obj = CreateObject(sceneData.objects[i], GetEntityCoords(ped), true, false, false)
        entities[i] = obj
    end

    for i = 1, #sceneData.animations do
        playScene(sceneData, sceneData.animations[i])
    end

    for i = 1, #entities do
        if DoesEntityExist(entities[i]) then
            DeleteEntity(entities[i])
        end
    end
    entities = {}
end

if config.keybind then
    RegisterKeyMapping(config.command, 'Scene Menu', 'keyboard', config.keybind)
end

RegisterCommand(config.command, function()
    local ped = PlayerPedId()
    local options = {}

    if #config.scenes > 0 then
        for i = 1, #config.scenes do
            options[i] = {
                title = config.scenes[i].label,
                description = 'Objects: ' .. #config.scenes[i].objects,
                onSelect = function()
                    if IsPedInAnyVehicle(ped, false) then
                        lib.notify({ title = 'Error', description = 'You cannot use this command while in a vehicle.', type = 'error' })
                        return
                    end

                    setupScene(config.scenes[i])
                end
            }
        end
    else
        options[1] = {
            title = 'No scenes found',
            disabled = true,
        }
    end

    lib.registerContext({
        id = 'easy_scenes:main',
        title = 'Scenes',
        options = options
    })
    lib.showContext('easy_scenes:main')
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for i = 1, #entities do
            if DoesEntityExist(entities[i]) then
                DeleteEntity(entities[i])
            end
        end
        entities = {}
    end
end)