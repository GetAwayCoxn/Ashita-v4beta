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
local fonts = require('fonts');
local Defense = 0;
local Attack = 0;
local MainJob = 0;
local SubJob = 0;
local MainJobLV = 0;
local SubJobLV = 0;
local ExpHas = 0;
local ExpNeed = 0;
local CpHas = 0;
local CpSpent = 0;
local MasterHas = 0;
local MasterNeed = 0;

local playerinfo = {};

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


function playerinfo.Update()
	local JOBid = AshitaCore:GetMemoryManager():GetPlayer():GetMainJob();
	Defense = AshitaCore:GetMemoryManager():GetPlayer():GetAttack();
	Attack = AshitaCore:GetMemoryManager():GetPlayer():GetDefense();
	MainJob = AshitaCore:GetResourceManager():GetString("jobs.names_abbr", mainJob);
	SubJob = AshitaCore:GetResourceManager():GetString("jobs.names_abbr", subJob);
	MainJobLV = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
	SubJobLV = AshitaCore:GetMemoryManager():GetPlayer():GetSubJobLevel();
	ExpHas = AshitaCore:GetMemoryManager():GetPlayer():GetExpCurrent();
	ExpNeed = AshitaCore:GetMemoryManager():GetPlayer():GetExpNeeded();
	CpHas = AshitaCore:GetMemoryManager():GetPlayer():GetCapacityPoins(JOBid);
	CpSpent = AshitaCore:GetMemoryManager():GetPlayer():GetJobPointsSpent(JOBid);
	MasterHas = AshitaCore:GetMemoryManager():GetPlayer():GetMasteryExp();
	MasterNeed = AshitaCore:GetMemoryManager():GetPlayer():GetMasteryExpNeeded();
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
		local display = 'Attk:' .. Attack .. '   Def:' .. Defense .. '   WS:' .. wskill ;
		playerinfo.FontObject.text = display;
	end);
end

return playerinfo;