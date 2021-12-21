addon.name      = 'Data';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'Tracks things.';
addon.link      = 'https://github.com/GetAwayCoxn/';

require('common');
local chat = require('chat');
local interface = require('interface');
imgui = require('imgui');

ashita.events.register('load', 'load_cb', interface.load);

ashita.events.register('unload', 'unload_cb', interface.unload);

ashita.events.register('d3d_present', 'present_cb', interface.render);

local function iifp(t, tmsg, fmsg)
    local cond, m = unpack(t);
    if (cond) then
        print(chat.header(addon.name):append(tmsg));
    else
        print(chat.header(addon.name):append(fmsg:fmt(m)));
    end
end

ashita.events.register('command', 'command_cb', function (e)
    -- Parse the command arguments..
    local args = e.command:args();
    if (#args == 0) then
        return;
    end
    if (args[1] ~= '/db') and (args[1] ~= '/database') then
        return;
    end

    -- Block all related commands..
    e.blocked = true;

    -- Handle: /database
    -- Handle: /database interface
    if (#args == 1 or (#args >= 2 and args[2]:any('interface'))) then
        interface.is_open[1] = not interface.is_open[1];
        return;
    end

    -- Handle: /database save - Saves the current settings.
    if (#args >= 2 and args[2]:any('save')) then
        interface.settings.save();
        print(chat.header(addon.name):append(chat.message('Settings saved.')));
        return;
    end

    -- Handle: /database reload - Reloads the current settings from disk.
    if (#args >= 2 and args[2]:any('reload')) then
        interface.settings.reload();
        print(chat.header(addon.name):append(chat.message('Settings reloaded.')));
        return;
    end

    -- Handle: /database reset - Resets the current settings.
    if (#args >= 2 and args[2]:any('reset')) then
        interface.settings.reset();
        print(chat.header(addon.name):append(chat.message('Settings reset to defaults.')));
        return;
    end

    -- Handle: /database item add <itemid> - Adds an item to the watch list.
    if (#args >= 4 and args[2]:any('item', 'items') and args[3]:ieq('add')) then
        local id = args[4]:num();
        iifp(interface.lstMgr.add_watched_item:packed()(id),
            chat.message('Added item to watch list.'),
            chat.error('Failed to add item to watch list; \'%s\''));
        return;
    end

    -- Handle: /database item delete <itemid> - Deletes an item from the watch list.
    -- Handle: /database item del <itemid> - Deletes an item from the watch list.
    -- Handle: /database item remove <itemid> - Deletes an item from the watch list.
    -- Handle: /database item rem <itemid> - Deletes an item from the watch list.
    if (#args >= 4 and args[2]:any('item', 'items') and args[3]:any('delete', 'del', 'remove', 'rem')) then
        local id = args[4]:num();
        iifp(interface.lstMgr.delete_watched_item:packed()(id),
            chat.message('Removed item from watch list.'),
            chat.error('Failed to remove item from watch list; \'%s\''));
        return;
    end

    -- Handle: /database item clear - Clears the item watch list.
    if (#args >= 3 and args[2]:any('item', 'items') and args[3]:ieq('clear')) then
        interface.lstMgr.clear_watched_items();
        print(chat.header(addon.name):append(chat.message('Removed all watched items.')));
        return;
    end

    -- Handle: /database key add <id> - Adds a key item to the watch list.
    if (#args >= 4 and args[2]:any('key', 'keys') and args[3]:ieq('add')) then
        local id = args[4]:num();
        iifp(interface.lstMgr.add_watched_keyitem:packed()(id),
            chat.message('Added key item to watch list.'),
            chat.error('Failed to add key item to watch list; \'%s\''));
        return;
    end

    -- Handle: /database key delete <id> - Deletes a key item from the watch list.
    -- Handle: /database key del <id> - Deletes a key item from the watch list.
    -- Handle: /database key remove <id> - Deletes a key item from the watch list.
    -- Handle: /database key rem <id> - Deletes a key item from the watch list.
    if (#args >= 4 and args[2]:any('key', 'keys') and args[3]:any('delete', 'del', 'remove', 'rem')) then
        local id = args[4]:num();
        iifp(interface.lstMgr.delete_watched_keyitem:packed()(id),
            chat.message('Removed key item from watch list.'),
            chat.error('Failed to remove key item from watch list; \'%s\''));
        return;
    end

    -- Handle: /database key clear - Clears the key item watch list.
    if (#args >= 3 and args[2]:any('key', 'keys') and args[3]:ieq('clear')) then
        interface.lstMgr.clear_watched_keyitems();
        print(chat.header(addon.name):append(chat.message('Removed all watched key items.')));
        return;
    end

    -- Handle: /database list load <name>
    if (#args >= 4 and args[2]:any('list', 'lists') and args[3]:ieq('load')) then
        interface.lstMgr.refresh_saved_lists();

        -- Find the index of the list..
        local lst = interface.lstMgr.saved_lists;
        for x = 1, #lst do
            if (lst[x]:ieq(args:concat(' ', 4):lower():append('.lst'))) then
                iifp(interface.lstMgr.load_list:packed()(x - 1, false),
                    chat.message('Loaded saved watch list.'),
                    chat.error('Failed to load watch list; \'%s\''));
                return;
            end
        end

        print(chat.header(addon.name):append(chat.error('Failed to load list; invalid list file name.')));
        return;
    end

    -- Handle: /database list merge <name>
    if (#args >= 4 and args[2]:any('list', 'lists') and args[3]:ieq('merge')) then
        interface.lstMgr.refresh_saved_lists();

        -- Find the index of the list..
        local lst = interface.lstMgr.saved_lists;
        for x = 1, #lst do
            if (lst[x]:ieq(args:concat(' ', 4):lower():append('.lst'))) then
                iifp(interface.lstMgr.load_list:packed()(x - 1, true),
                    chat.message('Loaded saved watch list.'),
                    chat.error('Failed to load watch list; \'%s\''));
                return;
            end
        end

        print(chat.header(addon.name):append(chat.error('Failed to load list; invalid list file name.')));
        return;
    end
end);