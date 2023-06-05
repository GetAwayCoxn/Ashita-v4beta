require('common');

local settings = T{ };
settings["job_settings"] = T{ };
settings["job_settings"]["COR"] = T{ };
settings["job_settings"]["RNG"] = T{ };
settings["job_settings"]["THF"] = T{ };
settings["job_settings"]["COR"]["Ammo"] = "Bronze Bullet";
settings["job_settings"]["COR"]["Delay"] = 1.3;
settings["job_settings"]["COR"]["AmmoBag"] = "Brz. Bull. Pouch";
settings["job_settings"]["COR"]["HaltOnTp"] = true;
settings["job_settings"]["COR"]["WeaponSkill"] = "Leaden Salute";
settings["job_settings"]["RNG"]["Ammo"] = "Stone Arrow";
settings["job_settings"]["RNG"]["Delay"] = 1.5;
settings["job_settings"]["RNG"]["AmmoBag"] = "Stone Quiver";
settings["job_settings"]["RNG"]["HaltOnTp"] = true;
settings["job_settings"]["RNG"]["WeaponSkill"] = "true flight";
settings["job_settings"]["THF"]["Ammo"] = "Bronze Bolt";
settings["job_settings"]["THF"]["Delay"] = 1.3;
settings["job_settings"]["THF"]["AmmoBag"] = "B. Bolt Quiver";
settings["job_settings"]["THF"]["HaltOnTp"] = false;
settings["job_settings"]["THF"]["WeaponSkill"] = "";
settings["language"] = 1;
settings["player_mjob"] = "COR";
settings["auto"] = false;

return settings;
