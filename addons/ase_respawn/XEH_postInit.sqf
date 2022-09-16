if (!hasInterface) exitWith {};

if (ASE_setting_respawn_enableUnconsciousSpectator) then {

	[] spawn {
		
		waitUntil { time > 0 };
		["ace_unconscious", ASE_fnc_initUnconsciousSpectator] call CBA_fnc_addEventHandler;
		player addEventHandler ["Killed", ASE_fnc_closeUnconsciousSpectator];
		
	};

};