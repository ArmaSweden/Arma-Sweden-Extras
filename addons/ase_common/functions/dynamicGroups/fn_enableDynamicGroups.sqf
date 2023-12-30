if (!isMultiplayer) exitWith {};

if (isServer) then {

	["Initialize", [true]] call BIS_fnc_dynamicGroups;

};

if (hasInterface) then {
	
	["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

};