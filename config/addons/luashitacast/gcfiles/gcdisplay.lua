local Toggles = {};
local fonts = require('fonts');
local Defense = 0;
local Attack = 0;

local gcdisplay = {
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

function gcdisplay.AdvanceToggle(name)
	if (type(Toggles[name]) ~= 'boolean') then
		return;
	elseif Toggles[name] then
		Toggles[name] = false;
	else
		Toggles[name] = true;
	end
end

function gcdisplay.UpdateDef()
	local data = gData.GetEquipScreen();
	Defense = data.Defense;
	Attack = data.Attack;
end

function gcdisplay.CreateToggle(name, default)
	Toggles[name] = default;
end

function gcdisplay.GetToggle(name)
	if (Toggles[name] ~= nil) then
		return Toggles[name];
	else
		return false;
	end
end

function gcdisplay.Unload()
	if (gcdisplay.FontObject ~= nil) then
		gcdisplay.FontObject:destroy();
	end
	ashita.events.unregister('d3d_present', 'gcdisplay_present_cb');
end

function gcdisplay.Initialize()
	local player = gData.GetPlayer();
	local data = gData.GetEquipScreen();
	gcdisplay.FontObject = fonts.new(fontSettings);	
	ashita.events.register('d3d_present', 'gcdisplay_present_cb', function ()
		local outText = 'Attk:' .. Attack .. '   Def:' .. Defense .. '   WS:' .. wskill ;
		for key, value in pairs(Toggles) do
			outText = outText .. '   ';
			if (value == true) then
				outText = outText .. '|cFF00FF00|' .. key .. '|r';
			else
				outText = outText .. '|cFFFF0000|' .. key .. '|r';
			end
		end
		gcdisplay.FontObject.text = outText;
	end);
end

return gcdisplay;