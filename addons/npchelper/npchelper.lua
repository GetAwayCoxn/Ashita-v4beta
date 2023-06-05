addon.name      = 'npchelper'
addon.author    = 'GetAwayCoxn'
addon.version   = '1.0'
addon.desc      = 'a very basic npc helper'
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons'

require('common')
local interface = require('interface')

ashita.events.register('load', 'load_cb', interface.Load)

ashita.events.register('unload', 'unload_cb', interface.Unload)

ashita.events.register('d3d_present', 'present_cb', interface.Render)

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args()
    if (#args == 0) or (args[1] ~= '/npchelper') then
        return
    end

    e.blocked = true

    if #args == 1 then
        -- interface.is_open[1] = not interface.is_open[1]
        interface.active = not interface.active
    elseif #args == 2 and args[2]:any('debug') then
        interface.debug = not interface.debug
    end
end)

ashita.events.register('text_in', 'text_in_callback1', function (e)
    if not interface.active then return end

    if e.message:contains('Obtained:') then
        if e.message:contains("Royal Squire's") then
            AshitaCore:GetMemoryManager():GetTarget():SetTarget(79, false)
            interface.DoHalbards:once(2)
        elseif e.message:contains("Acheron") then
            interface.DoShields:once(2)
        elseif e.message:contains("You may use up to") and e.message:contains("more sparks") then
            -- interface.DoCulverin:once(2)
        end
    end
end)

-- ashita.events.register('packet_in', '__settings_packet_in_cb', function (e)
    -- Packet: Zone Exit
    -- if (e.id == 0x000B) then
        -- AshitaCore:GetChatManager():QueueCommand(1, '/addon unload npchelper')
    -- elseif (e.id == 0x118) then
    --     interface.HandleCurrency2(e)
    -- end
-- end)