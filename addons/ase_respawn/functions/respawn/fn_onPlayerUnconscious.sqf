params ["_unit", "_state"];

if (_state) then {

	[] spawn {

		localNamespace setVariable ["ASE_isBootingUnconsciousSpectatorCamera", true];
		sleep 4;
		cutText ["", "BLACK OUT", 0.25];
		sleep 1;
		["Initialize", [player, [], false, false, true, false, false, false, false, false]] call BIS_fnc_EGSpectator;
		cutText ["","BLACK IN"];
		localNamespace setVariable ["ASE_isBootingUnconsciousSpectatorCamera", false];

	};

} else {

	[] spawn {

		waitUntil { !(localNamespace getVariable ["ASE_isBootingUnconsciousSpectatorCamera", false]) };

		cutText ["", "BLACK OUT", 0.25];
		sleep 0.25;
		["Terminate"] call BIS_fnc_EGSpectator;
		cutText ["","BLACK IN", 0.25];

	};

};