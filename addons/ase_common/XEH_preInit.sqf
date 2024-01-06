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

if (isClass(configFile >> "CfgPatches" >> "tfar_core")) then {

	[
		"ASE_setting_common_enableAutoStopYelling",
		"CHECKBOX",
		["Stop yelling after delay", "Automatically returns to normal speech volume after a delay."],
		["ASE Common", "Yelling"],
		false,
		nil,
		{ if (_this) then { call ASE_fnc_enableAutoStopYelling } else { call ASE_fnc_disableAutoStopYelling } },
		false
	] call CBA_fnc_addSetting;

	[
		"ASE_setting_common_autoStopYellingTime",
		"SLIDER",
		["Delay", "Seconds until voice volume is returned to normal."],
		["ASE Common", "Yelling"],
		[
			10,
			300,
			60,
			0
		],
		nil,
		{},
		false
	] call CBA_fnc_addSetting;

};