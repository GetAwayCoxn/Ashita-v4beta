require('common');

local settings = T{ };
settings["move"] = T{ };
settings["move"]["drag_y"] = 22;
settings["move"]["drag_x"] = 172;
settings["move"]["shift_down"] = false;
settings["move"]["dragging"] = false;
settings["scale"] = 1;
settings["party_buffs"] = false;
settings["padding"] = 1;
settings["locked"] = false;
settings["opacity"] = 1;

return settings;
