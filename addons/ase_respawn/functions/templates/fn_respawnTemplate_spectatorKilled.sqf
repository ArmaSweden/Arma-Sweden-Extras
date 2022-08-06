// TODO: List incompatible templates

params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

if (_respawnDelay < 5) exitWith {};

setPlayerRespawnTime _respawnDelay;

private _side = side group _oldUnit;

sleep 2;
cutText ["", "BLACK OUT", 0.25];
sleep 1;
[[_side]] call ASE_fnc_openSpectator;
cutText ["","BLACK IN"];

waitUntil { playerRespawnTime <= 0 };

// Fade out if ASE Position template is not enabled
if (!("ASE_position" in getMissionConfigValue ["respawnTemplates", []])) then {
	cutText ["","BLACK OUT", 0.25];
	sleep 1;
	["Terminate"] call BIS_fnc_EGSpectator;
	cutText ["","BLACK IN"];
};