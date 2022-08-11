// TODO: Add settings for respawn templates

[
	"ASE_setting_respawn_enableUnconsciousSpectator",
	"CHECKBOX",
	["Spectate when unconscious", "Throws player into spectator mode when unconscious."],
	["ASE Respawn", "Spectating when unconscious"],
	false
] call CBA_fnc_addSetting;

/*
[
	"ASE_setting_respawn_unconsciousSpectatorList",
	"LIST",
	["Allowed to spectate", "Spectating rules for the unconscious player."],
	["ASE Respawn", "Spectating when unconscious"],
	[
		[0, 1, 2, 3],
		["Body", "Squad", "Side", "All"],
		0
	]
] call CBA_fnc_addSetting;

[
	"ASE_setting_respawn_enableUnconsciousSpectateAI",
	"CHECKBOX",
	["Can spectate AI", "Enable spectating of AI units when unconscious."],
	["ASE Respawn", "Spectating when unconscious"],
	true
] call CBA_fnc_addSetting;
*/