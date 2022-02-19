require('common');

local settings = T{ };
settings["move"] = T{ };
settings["move"]["drag_y"] = 3;
settings["move"]["drag_x"] = 204;
settings["move"]["shift_down"] = false;
settings["move"]["dragging"] = false;
settings["scale"] = 1;
settings["party_buffs"] = true;
settings["padding"] = 1;
settings["locked"] = false;
settings["opacity"] = 1;

return settings;
