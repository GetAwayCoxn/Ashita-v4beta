addon.name      = 'spawntracker';
addon.author    = 'GetAwayCoxn';
addon.version   = '1.0';
addon.desc      = 'simple text display to track mobs by index';
addon.link      = 'https://github.com/GetAwayCoxn/Ashita-v4-Addons';

require('common');
local fonts = require('fonts');
local settings = require('settings');

local display = {};
local osd = {};
local area = '';
local now = os.clock();
local deathCheck = true;
local defaults = T{
	call = false;
	callnumber = '4';
    visible = true,
	font_family = 'Arial',
	font_height = 12,
	color = 0xFFFFFFFF,
	green = '|cFF00FF00|';
	red = '|cFFFF0000|';
	yellow = '|cFFFFFF00|';
	position_x = 500,
	position_y = 500,
	background = T{
		visible = true,
		color = 0xFF000000,
	},
	mobs = T{},--k is TargetIndex, v is {Name,boolean check,Distance,HPPercent,boolean check,deathTime,}
};

settings.register('settings', 'settings_update', function (s)
    if (s ~= nil) then
        osd = s;
    end
    settings.save();
end);

ashita.events.register('load', 'load_cb', function()
	osd = settings.load(defaults);
    
    display = fonts.new(osd);
end);

ashita.events.register('unload', 'unload_cb', function()
	settings.save();

    if (display ~= nil) then
		display:destroy();
	end
end);

ashita.events.register('d3d_present', 'present_cb', function ()
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	display.text = '';
	if (player:GetIsZoning() ~= 0) or not osd.visible then
		return;
	end
	
	area = AshitaCore:GetResourceManager():GetString("zones.names", AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0));
	if osd.mobs[area] == nil then return end;

	local t = 0;

	for k,v in pairs(osd.mobs[area]) do
		local distancecheck = false;
		
		local mob = GetEntity(k);
		if mob == nil then 
			v[2] = false;
			v[3] = 51;
			v[4] = 1;
		else
			v[1] = mob.Name;
			v[3] = tonumber(('%2i'):fmt(math.sqrt(mob.Distance)));
			v[4] = mob.HPPercent;

			if v[3] > 50 then 
				v[2] = true;
				distancecheck = true;
			elseif v[4] == 100 then 
				v[2] = true;
				deathCheck = true;
			else
				v[2] = false;
			end
		end
		
		if v[4] == 0 and deathCheck then 
			v[6] = os.clock();
			deathCheck = false;
			print(tostring(v[6]) .. tostring(k))
		end

		t = t + 1;
        if t == 1 then
			display.text = 'Mobs Being Tracked(index):'
			if osd.call then
				display.text = display.text .. '   ' .. osd.green .. 'Call: ' .. tostring(osd.callnumber)
			else
				display.text = display.text .. '   ' .. osd.red .. 'Call: ' .. tostring(osd.callnumber)
			end
		end

		if v[2] then
			if not distancecheck then
			display.text = display.text .. '\n';
			display.text = display.text .. osd.green .. v[1] .. '(' .. tostring(k) .. ')  HPP:' .. tostring(v[4]) .. '%  Distance:' .. tostring(v[3]);
				if osd.call and (v[5] == nil or v[5]) then
					local str = '/p <call' .. osd.callnumber .. '>';
					AshitaCore:GetChatManager():QueueCommand(1, str);
					v[5] = false;
					local function mobpop()
						AshitaCore:GetChatManager():QueueCommand(1, '/p ' .. v[1] .. ' Pop!')
					end
					mobpop:once(1);
				end
			elseif v[4] ~= 0 then
				display.text = display.text .. '\n';
				display.text = display.text .. osd.yellow .. v[1] .. '(' .. tostring(k) .. ')  HPP:' .. tostring(v[4]) .. '%  Distance:' .. tostring(v[3]);
			else
				display.text = display.text .. '\n';
				display.text = display.text .. osd.red .. v[1] .. '(' .. tostring(k) .. ') ' .. timeCalc(v[6]);
				v[5] = true;
			end
		else
			display.text = display.text .. '\n';
			display.text = display.text .. osd.red .. v[1] .. '(' .. tostring(k) .. ') ' ..  timeCalc(v[6]);
			v[5] = true;
		end
	end

	if display.position_x ~= osd.position_x or display.position_y ~= osd.position_y then
        osd.position_x = display.position_x;
        osd.position_y = display.position_y;
        settings.save();
    end
end);

ashita.events.register('command', 'command_cb', function (e)
	local args = e.command:args();
    if (#args == 0) or ((args[1] ~= '/spawntracker') and (args[1] ~= '/st')) then
        return;
    end

    e.blocked = true;

	if #args == 1 then
		osd.visible = not osd.visible
	elseif args[2] == 'add' then
		if args[3] ~= nil then
			addmob(tonumber(args[3]));
		else
			addmob(AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0));
		end
	elseif args[2] == 'clear' then
		osd.mobs[area] = T{};
	elseif args[2] == 'test' then
		test(now);
	elseif args[2] == 'call' then
		if args[3] ~= nil then
			osd.callnumber = (args[3]);
		else
			osd.call = not osd.call;
		end
	elseif args[2] == 'delete' or args[2] == 'del' then
		if args[3] ~= nil then
			osd.mobs[area][tonumber(args[3])] = nil;
		else
			osd.mobs[area][AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0)] = nil;
		end
	end
end);

function addmob(index)
	if index == nil then return end;
	local target = GetEntity(index);
	if target == nil then return end;
	if osd.mobs[area] == nil then osd.mobs[area] = T{} end
	osd.mobs[area][index] = {target.Name,target.HPPercent};
end

function timeCalc(time)
	time = time or os.clock();
    local t =  time - os.clock();
    local m = string.format("%02i", (1200-t)/60);
    local s = string.format("%02i", (1200 - (60*m)) - t);
    local str = m .. ':' .. s;
    return str;
end

function test(time)
    local t = os.clock() - time;
    local m = string.format("%02i", (3600-t)/60);
    local s = string.format("%02i", (3600-(60*m)) - t);
    local str = m .. ':' .. s;
    print(str)
end