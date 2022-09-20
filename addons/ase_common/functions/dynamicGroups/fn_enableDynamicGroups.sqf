if (!isMultiplayer) exitWith {};
if (["IsInitialized"] call BIS_fnc_dynamicGroups) exitWith {};

if (isServer) then {

	["Initialize", [true]] call BIS_fnc_dynamicGroups;

};

if (hasInterface) then {
	
	["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

};