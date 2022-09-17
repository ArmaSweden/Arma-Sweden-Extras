// TODO: Add settings for respawn templates

[
	"ASE_setting_respawn_enableUnconsciousSpectator",
	"CHECKBOX",
	["Enabled", "Throws player into spectator mode when unconscious."],
	["ASE Respawn", "Unconscious spectator"],
	false,
	nil,
	{},
	true
] call CBA_fnc_addSetting;

[
	"ASE_setting_respawn_unconsciousSpectatorList",
	"LIST",
	["Allowed to spectate", "Spectating rules for the unconscious player."],
	["ASE Respawn", "Unconscious spectator"],
	[
		[0, 1, 2],
		["Body", "Player side", "All sides"],
		0
	],
	nil,
	{},
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_respawn_enableUnconsciousSpectateAI",
	"CHECKBOX",
	["Can spectate AI", "Enable spectating of AI units when unconscious."],
	["ASE Respawn", "Unconscious spectator"],
	true,
	nil,
	{},
	false
] call CBA_fnc_addSetting;