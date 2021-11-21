--[[
* Addons - Copyright (c) 2021 Ashita Development Team
* Contact: https://www.ashitaxi.com/
* Contact: https://discord.gg/Ashita
*
* This file is part of Ashita.
*
* Ashita is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Ashita is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with Ashita.  If not, see <https://www.gnu.org/licenses/>.
--]]

addon.name      = 'playerinfo';
addon.author    = 'getawaycoxn';
addon.version   = '1.0';
addon.desc      = 'Basic display of basic player information.';
addon.link      = 'https://ashitaxi.com/';

require('common');
local chat = require('chat');
local settings = require('settings');
local Cycles = {};
local Toggles = {};
local fonts = require('fonts');
local Defense = 0;
local Attack = 0;

local playerinfo = {
	Toggles = {},
	Values = {}
};

local fontSettings = T{
	visible = true,
	font_family = 'Arial',
	font_height = 12,
	color = 0xFFFFFFFF,
	position_x = 800,
	position_y = 800,
	background = T{
		visible = true,
		color = 0xFF000000,
	}
};

function playerinfo.AdvanceCycle(name)
	local ctable = Cycles[name];
	if (type(ctable) ~= 'table') then
		return;
	end
	
	ctable.Index = ctable.Index + 1;
	if (ctable.Index > #ctable.Array) then
		ctable.Index = 1;
	end
end

function playerinfo.AdvanceToggle(name)
	if (type(Toggles[name]) ~= 'boolean') then
		return;
	elseif Toggles[name] then
		Toggles[name] = false;
	else
		Toggles[name] = true;
	end
end

function playerinfo.UpdateDef()
	local data = gData.GetEquipScreen();
	Defense = data.Defense;
	Attack = data.Attack;
end

function playerinfo.CreateToggle(name, default)
	Toggles[name] = default;
end

function playerinfo.CreateCycle(name, values)
	local newCycle = {
		Index = 1,
		Array = values
	};
	Cycles[name] = newCycle;
end

function playerinfo.GetCyclefunction(name)
	local ctable = Cycles[name];
	if (type(ctable) == 'table') then
		return ctable.Array[ctable.Index];
	else
		return 'Unknown';
	end
end

function playerinfo.GetToggle(name)
	if (Toggles[name] ~= nil) then
		return Toggles[name];
	else
		return false;
	end
end

function playerinfo.Unload()
	if (playerinfo.FontObject ~= nil) then
		playerinfo.FontObject:destroy();
	end
	ashita.events.unregister('d3d_present', 'playerinfo_present_cb');
end

function playerinfo.Initialize()
	local player = gData.GetPlayer();
	local data = gData.GetEquipScreen();
	playerinfo.FontObject = fonts.new(fontSettings);	
	ashita.events.register('d3d_present', 'playerinfo_present_cb', function ()
		local outText = 'Attk:' .. Attack .. '   Def:' .. Defense .. '   WS:' .. wskill ;
		for key, value in pairs(Toggles) do
			outText = outText .. '   ';
			if (value == true) then
				outText = outText .. '|cFF00FF00|' .. key .. '|r';
			else
				outText = outText .. '|cFFFF0000|' .. key .. '|r';
			end
		end
		for key, value in pairs(Cycles) do
			outText = outText .. '  ' .. key .. ': ' .. '|cFF00FF00|' .. value.Array[value.Index] .. '|r';
		end
		playerinfo.FontObject.text = outText;
	end);
end

return playerinfo;