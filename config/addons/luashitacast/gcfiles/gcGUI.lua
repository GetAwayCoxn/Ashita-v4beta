local Cycles = {};
local Toggles = {};
local fonts = require('fonts');

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

function gcdisplay.AdvanceCycle(name)
	local ctable = Cycles[name];
	if (type(ctable) ~= 'table') then
		return;
	end
	
	ctable.Index = ctable.Index + 1;
	if (ctable.Index > #ctable.Array) then
		ctable.Index = 1;
	end
end

function gcdisplay.AdvanceToggle(name)
	if (type(Toggles[name]) ~= 'boolean') then
		return;
	elseif Toggles[name] then
		Toggles[name] = false;
	else
		Toggles[name] = true;
	end
end

--name must be a valid lua variable name in string format.
--default must be a boolean
function gcdisplay.CreateToggle(name, default)
	Toggles[name] = default;
end

--name must be a valid lua variable name in string format.
--values must be an array style table containing only strings mapped to sequential indices.
--first value in table will be default.
function gcdisplay.CreateCycle(name, values)
	local newCycle = {
		Index = 1,
		Array = values
	};
	Cycles[name] = newCycle;
end

function gcdisplay.GetCyclefunction(name)
	local ctable = Cycles[name];
	if (type(ctable) == 'table') then
		return ctable.Array[ctable.Index];
	else
		return 'Unknown';
	end
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
	--local MagicDefense = AshitaCore:GetMemoryManager():GetPlayer():GetEvasion();
	gcdisplay.FontObject = fonts.new(fontSettings);	
	ashita.events.register('d3d_present', 'gcdisplay_present_cb', function ()
		local outText = 'Attk:' .. data.Attack .. '   Def:' .. data.Defense .. '   WS:' .. wskill ;
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
		gcdisplay.FontObject.text = outText;
	end);
end

return gcdisplay;