addon.name      = 'database';
addon.author    = 'getawaycoxn';
addon.version   = '1.0';
addon.desc      = 'Tracks things.';
addon.link      = 'https://ashitaxi.com/';

require('common');
local chat = require('chat');
local interface = require('interface');

--[[
* event: load
* desc : Event called when the addon is being loaded.
--]]
ashita.events.register('load', 'load_cb', interface.load);

--[[
* event: unload
* desc : Event called when the addon is being unloaded.
--]]
ashita.events.register('unload', 'unload_cb', interface.unload);

--[[
* event: d3d_present
* desc : Event called when the Direct3D device is presenting a scene.
--]]
ashita.events.register('d3d_present', 'present_cb', interface.render);

--[[
* Conditional printer. Prints the 'tmsg' message on true conditions, or 'fmsg' otherwise.
*
* @param {table} t - Table that contains the condition and a message on error.
* @param {string} tmsg - The message to print if the condition is true.
* @param {string} fmsg - The message to print if the condition is false.
--]]
local function iifp(t, tmsg, fmsg)
    local cond, m = unpack(t);
    if (cond) then
        print(chat.header(addon.name):append(tmsg));
    else
        print(chat.header(addon.name):append(fmsg:fmt(m)));
    end
end

--[[
* event: command
* desc : Event called when the addon is processing a command.
--]]
ashita.events.register('command', 'command_cb', function (e)
    -- Parse the command arguments..
    local args = e.command:args();
    if (#args == 0 or not args[1]:any('/itemwatch')) then
        return;
    end

    -- Block all related commands..
    e.blocked = true;

    -- Handle: /itemwatch
    -- Handle: /itemwatch interface
    if (#args == 1 or (#args >= 2 and args[2]:any('interface'))) then
        interface.is_open[1] = not interface.is_open[1];
        return;
    end

    -- Handle: /itemwatch save - Saves the current settings.
    if (#args >= 2 and args[2]:any('save')) then
        interface.settings.save();
        print(chat.header(addon.name):append(chat.message('Settings saved.')));
        return;
    end

    -- Handle: /itemwatch reload - Reloads the current settings from disk.
    if (#args >= 2 and args[2]:any('reload')) then
        interface.settings.reload();
        print(chat.header(addon.name):append(chat.message('Settings reloaded.')));
        return;
    end

    -- Handle: /itemwatch reset - Resets the current settings.
    if (#args >= 2 and args[2]:any('reset')) then
        interface.settings.reset();
        print(chat.header(addon.name):append(chat.message('Settings reset to defaults.')));
        return;
    end

    -- Handle: /itemwatch item add <itemid> - Adds an item to the watch list.
    if (#args >= 4 and args[2]:any('item', 'items') and args[3]:ieq('add')) then
        local id = args[4]:num();
        iifp(interface.lstMgr.add_watched_item:packed()(id),
            chat.message('Added item to watch list.'),
            chat.error('Failed to add item to watch list; \'%s\''));
        return;
    end

    -- Handle: /itemwatch item delete <itemid> - Deletes an item from the watch list.
    -- Handle: /itemwatch item del <itemid> - Deletes an item from the watch list.
    -- Handle: /itemwatch item remove <itemid> - Deletes an item from the watch list.
    -- Handle: /itemwatch item rem <itemid> - Deletes an item from the watch list.
    if (#args >= 4 and args[2]:any('item', 'items') and args[3]:any('delete', 'del', 'remove', 'rem')) then
        local id = args[4]:num();
        iifp(interface.lstMgr.delete_watched_item:packed()(id),
            chat.message('Removed item from watch list.'),
            chat.error('Failed to remove item from watch list; \'%s\''));
        return;
    end

    -- Handle: /itemwatch item clear - Clears the item watch list.
    if (#args >= 3 and args[2]:any('item', 'items') and args[3]:ieq('clear')) then
        interface.lstMgr.clear_watched_items();
        print(chat.header(addon.name):append(chat.message('Removed all watched items.')));
        return;
    end

    -- Handle: /itemwatch key add <id> - Adds a key item to the watch list.
    if (#args >= 4 and args[2]:any('key', 'keys') and args[3]:ieq('add')) then
        local id = args[4]:num();
        iifp(interface.lstMgr.add_watched_keyitem:packed()(id),
            chat.message('Added key item to watch list.'),
            chat.error('Failed to add key item to watch list; \'%s\''));
        return;
    end

    -- Handle: /itemwatch key delete <id> - Deletes a key item from the watch list.
    -- Handle: /itemwatch key del <id> - Deletes a key item from the watch list.
    -- Handle: /itemwatch key remove <id> - Deletes a key item from the watch list.
    -- Handle: /itemwatch key rem <id> - Deletes a key item from the watch list.
    if (#args >= 4 and args[2]:any('key', 'keys') and args[3]:any('delete', 'del', 'remove', 'rem')) then
        local id = args[4]:num();
        iifp(interface.lstMgr.delete_watched_keyitem:packed()(id),
            chat.message('Removed key item from watch list.'),
            chat.error('Failed to remove key item from watch list; \'%s\''));
        return;
    end

    -- Handle: /itemwatch key clear - Clears the key item watch list.
    if (#args >= 3 and args[2]:any('key', 'keys') and args[3]:ieq('clear')) then
        interface.lstMgr.clear_watched_keyitems();
        print(chat.header(addon.name):append(chat.message('Removed all watched key items.')));
        return;
    end

    -- Handle: /itemwatch list load <name>
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

    -- Handle: /itemwatch list merge <name>
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