[
	"ASE_setting_common_enableDynamicGroups",
	"CHECKBOX",
	["Enable Dynamic Groups", "Enables Dynamic Groups functionality."],
	["ASE Common"],
	false,
	nil,
	{ if (_this) then { call ASE_fnc_enableDynamicGroups } else { call ASE_fnc_disableDynamicGroups } },
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_common_viewDistanceInterval",
	"LIST",
	["View distance interval", "The interval in meters when adjusting view distance on the fly."],
	["ASE Common"],
	[
		[500, 1000],
		["500", "1000"],
		0
	],
	nil,
	{},
	false
] call CBA_fnc_addSetting;