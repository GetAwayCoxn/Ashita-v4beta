local gcdisplay = {};
local Toggles = {};
local fonts = require('fonts');



local fontSettings = T{
	visible = true,
	font_family = 'Arial',
	font_height = 12,
	color = 0xFFFFFFFF,
	position_x = 400,
	position_y = 0,
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

function gcdisplay.Update()
	local MID = AshitaCore:GetMemoryManager():GetPlayer():GetMainJob();
	local SID = AshitaCore:GetMemoryManager():GetPlayer():GetSubJob();
	Def = AshitaCore:GetMemoryManager():GetPlayer():GetDefense();
	Attk = AshitaCore:GetMemoryManager():GetPlayer():GetAttack();
	Main = AshitaCore:GetResourceManager():GetString("jobs.names_abbr", MID);
	Sub = AshitaCore:GetResourceManager():GetString("jobs.names_abbr", SID);
	MainLV = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
	SubLV = AshitaCore:GetMemoryManager():GetPlayer():GetSubJobLevel();
	JPspent = AshitaCore:GetMemoryManager():GetPlayer():GetJobPointsSpent(MID);
	JPhave = AshitaCore:GetMemoryManager():GetPlayer():GetJobPoints(MID);
	CPhave = AshitaCore:GetMemoryManager():GetPlayer():GetCapacityPoints(MID);
	MasterLV = AshitaCore:GetMemoryManager():GetPlayer():GetMasteryJobLevel();
	MasterLVexp = (AshitaCore:GetMemoryManager():GetPlayer():GetMasteryExpNeeded()-AshitaCore:GetMemoryManager():GetPlayer():GetMasteryExp());
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
	gcdisplay.Update();
	gcdisplay.FontObject = fonts.new(fontSettings);	
	ashita.events.register('d3d_present', 'gcdisplay_present_cb', function ()
		local Section1 = '   JPspent:' .. JPspent .. '   JPcurrent:' .. JPhave;
		local Section2 = '   CPtnl:' .. (30000 - CPhave);
		if (JPspent == 2100) then
			Section1 = '   JPcurrent:' .. JPhave .. '   Mlv:' .. MasterLV;
			Section2 = '   MexpTNL:' .. MasterLVexp;
		end
		local display = MainLV .. Main .. '/' .. SubLV .. Sub .. Section1 .. Section2 ..'   Attk:' .. Attk .. '   Def:' .. Def .. '   WS:' .. wskill .. '   TP:' .. wstp;
		for k, v in pairs(Toggles) do
			display = display .. '   ';
			if (v == true) then
				display = display .. '|cFF00FF00|' .. k .. '|r';
			else
				display = display .. '|cFFFF0000|' .. k .. '|r';
			end
		end
		gcdisplay.FontObject.text = display;
	end);
end

return gcdisplay;