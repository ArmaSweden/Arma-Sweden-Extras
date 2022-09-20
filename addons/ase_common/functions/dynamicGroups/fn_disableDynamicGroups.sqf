if (!isMultiplayer) exitWith {};
if (!(["IsInitialized"] call BIS_fnc_dynamicGroups)) exitWith {};

if (isServer) then {

	["Terminate"] call BIS_fnc_dynamicGroups;

};

if (hasInterface) then {

	["TerminatePlayer"] call BIS_fnc_dynamicGroups;

};