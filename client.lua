local Config = {
    Blips = {
        {
            Name = 'Saint Denis Police Department',
            BlipHash = -693644997,
            Pos = vector3(2510.44, -1308.6, 48.95),
            BlipColor = 'LIGHT_BLUE',
        },
        {
            Name = 'Rhodes Sheriff Office',
            BlipHash = -693644997,
            Pos = vector3(1359.26, -1305.45, 77.76),
            BlipColor = 'LIGHT_BLUE',
        },
        {
            Name = 'Valentine Sheriffs Office',
            BlipHash = -693644997,
            Pos = vector3(-275.58, 805.14, 119.38),
            BlipColor = 'LIGHT_BLUE',
        },
        {
            Name = 'Sheriff Office Annesburg',
            BlipHash = -693644997,
            Pos = vector3(2909.04, 1311.16, 44.94),
            BlipColor = 'LIGHT_BLUE',
        },
        {
            Name = 'Strawberry Jail',
            BlipHash = -693644997,
            Pos = vector3(-1808.21, -350.11, 164.65),
            BlipColor = 'LIGHT_BLUE',
        },
        {
            Name = 'Blackwater Police Department',
            BlipHash = -693644997,
            Pos = vector3(-759.17, -1269.19, 44.04),
            BlipColor = 'LIGHT_BLUE',
        },
        {
            Name = 'Armadillo Sheriff',
            BlipHash = -693644997,
            Pos = vector3(-3623.69, -2604.26, -13.34),
            BlipColor = 'LIGHT_BLUE',
        },
        {
            Name = 'Tumbleweed Jail',
            BlipHash = -693644997,
            Pos = vector3(-5528.53, -2930.0, -1.36),
            BlipColor = 'LIGHT_BLUE',
        },
        
    },

    BlipColors = {
        LIGHT_BLUE    = 'BLIP_MODIFIER_MP_COLOR_1',
        DARK_RED      = 'BLIP_MODIFIER_MP_COLOR_2',
        PURPLE        = 'BLIP_MODIFIER_MP_COLOR_3',
        ORANGE        = 'BLIP_MODIFIER_MP_COLOR_4',
        TEAL          = 'BLIP_MODIFIER_MP_COLOR_5',
        LIGHT_YELLOW  = 'BLIP_MODIFIER_MP_COLOR_6',
        PINK          = 'BLIP_MODIFIER_MP_COLOR_7',
        GREEN         = 'BLIP_MODIFIER_MP_COLOR_8',
        WHITE         = 'BLIP_MODIFIER_MP_COLOR_32',
       
    }
}

function ClearBlips()
    for _, v in pairs(Config.Blips) do
        if v.BlipHandle then
            RemoveBlip(v.BlipHandle)
            v.BlipHandle = nil
        end
    end
end

function AddBlip(BlipSettings)
    local blipEntity = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, BlipSettings.Pos.x, BlipSettings.Pos.y, BlipSettings.Pos.z)
    SetBlipSprite(blipEntity, BlipSettings.BlipHash, 1)
    SetBlipScale(blipEntity, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, blipEntity, BlipSettings.Name)
    Citizen.InvokeNative(0x662D364ABF16DE2F, blipEntity, GetHashKey(Config.BlipColors[BlipSettings.BlipColor]))
    return blipEntity
end


Citizen.CreateThread(function()
    ClearBlips()
    for _, blipSettings in ipairs(Config.Blips) do
        blipSettings.BlipHandle = AddBlip(blipSettings)
    end
end)


AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    ClearBlips()
end)
