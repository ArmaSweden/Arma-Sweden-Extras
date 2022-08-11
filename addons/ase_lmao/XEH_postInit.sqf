if (!hasInterface) exitWith {};

if (ASE_setting_lmao_enableTapShoulderKnockout) then {

	[] spawn {
		
		waitUntil { time > 0 };
		["ace_interaction_tapShoulder", ASE_fnc_onTapShoulder] call CBA_fnc_addEventHandler;
		
	};

};