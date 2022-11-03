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