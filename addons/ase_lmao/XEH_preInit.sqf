[
	"ASE_setting_lmao_enableTapShoulderKnockout",
	"CHECKBOX",
	["Judo mode", "Having your shoulder tapped causes you to ragdoll."],
	["ASE Lmao"],
	false,
	nil,
	{ if (_this) then { call ASE_fnc_enableJudoMode } else { call ASE_fnc_disableJudoMode } },
	false
] call CBA_fnc_addSetting;