addon.name      = 'kistatus'
addon.author    = 'GetAwayCoxn'
addon.version   = '1.0'
addon.desc      = 'Display time remaining on odyssey and sortie key items'
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons'

require('common')
local settingsLib = require('settings')
local fonts = require('fonts')

local display = T{}
local settings = T{}
local lookForMoglophone = true
local lookForDullPlate = true
local defaults = T{
    moglophone = nil,
    plate = nil,
	visible = true,
	font_family = 'Arial',
	font_height = 12,
    -- bold = true,
	color = 0xFFFFFFFF,
	position_x = 500,
	position_y = -16,
	background = T{
		visible = true,
		color = 0x88000000,
	}
}

ashita.events.register('load', 'load_cb', function()
    settings = settingsLib.load(defaults);

    settingsLib.register('settings', 'settings_update', function (s)
        if(s ~= nil) then
            settings = s;
        end
        settingsLib.save();
    end);

    display = fonts.new(settings)
end)

ashita.events.register('unload', 'unload_cb', function()
    settingsLib.save()

    if display then
		display:destroy()
	end
end)

ashita.events.register('d3d_present', 'present_cb', function ()
    if display.position_x ~= settings.position_x or display.position_y ~= settings.position_y then
        settings.position_x = display.position_x
        settings.position_y = display.position_y
        settingsLib.save()
    end

    -- get the updated time each render
    local now = os.time()

    -- initialize output variables for new users
    local phoneRemaining = 'Get new moglophone to track'
    local plateRemaining = 'Enter Sortie to track'

    -- update output variables for users that have times saved from ki use
    if settings.moglophone then
        local phoneTime = now - settings.moglophone
        local phoneHours = string.format("%02i", 20 - math.ceil(phoneTime / 3600))
        local phoneMinutes = string.format("%02i", 60 - math.ceil((phoneTime - (20 - math.ceil(phoneTime / 3600))*3600) / 60)%60)
        local phoneSeconds = string.format("%02i", 60 - math.ceil(phoneTime % 60))
        phoneRemaining = phoneHours .. ':' .. phoneMinutes .. ':' .. phoneSeconds
        if phoneTime > 72000 then phoneRemaining = 'Ready!' end
    end
    if settings.plate then
        local plateTime = now - settings.plate
        local plateHours = string.format("%02i", 20 - math.ceil(plateTime / 3600))
        local plateMinutes = string.format("%02i", 60 - math.ceil((plateTime - (20 - math.ceil(plateTime / 3600))*3600) / 60)%60)
        local plateSeconds = string.format("%02i", 60 - math.ceil(plateTime % 60))
        plateRemaining = plateHours .. ':' .. plateMinutes .. ':' .. plateSeconds
        if plateTime > 72000 then plateRemaining = 'Ready!' end
    end

    -- initialize the final text output variable
    local output = "Moglophone: " .. tostring(phoneRemaining) .. "  Sortie Plate: " .. tostring(plateRemaining)

    display.text = output
end)

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args()
    if #args == 0 or args[1] ~= '/kistatus' then return end

    e.blocked = true
end)

ashita.events.register('text_in', 'text_in_callback1', function(e)
    if string.match(e.message, "Obtained") and string.match(e.message, "Moglophone.") then
        settings.moglophone = os.time()
    elseif e.message:contains("shiny") and e.message:contains("loses") then
        settings.plate = os.time()
    elseif e.message:contains("dull") and e.message:contains("power returns,") then
        settings.plate = 0
    end
end)
