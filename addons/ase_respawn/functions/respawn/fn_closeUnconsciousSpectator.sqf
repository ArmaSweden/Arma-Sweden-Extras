params ["_unit", "_killer", "_instigator", "_useEffects"];

if (!(["IsInitialized"] call BIS_fnc_EGSpectator)) exitWith {};

[] spawn {

	waitUntil { !(localNamespace getVariable ["ASE_isBootingUnconsciousSpectator", false]) };

	cutText ["", "BLACK OUT", 0.25];
	sleep 0.25;
	["Terminate"] call BIS_fnc_EGSpectator;
	cutText ["","BLACK IN", 0.25];

};