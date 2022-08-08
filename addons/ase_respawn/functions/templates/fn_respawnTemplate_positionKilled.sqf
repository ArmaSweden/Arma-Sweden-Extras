// TODO: List incompatible templates

params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

localNamespace setVariable ["ASE_isReadyToRespawn", false];
localNamespace setVariable ["ASE_selectedRespawnPoint", objNull];

setPlayerRespawnTime _respawnDelay;

if (!("ASE_spectator" in getMissionConfigValue ["respawnTemplates", []])) then {
	sleep 2;
	cutText ["", "BLACK OUT", 0.25];
	sleep 1;
	call ASE_fnc_openRespawnMap;
	cutText ["","BLACK IN", 0.25];
};

waitUntil { playerRespawnTime <= 0 };

localNamespace setVariable ["ASE_isReadyToRespawn", true];
setPlayerRespawnTime 99999;

// TODO: Check if respawn point still exists
waitUntil { !((localNamespace getVariable ["ASE_selectedRespawnPoint", objNull]) isEqualTo objNull) };

setPlayerRespawnTime 0;
// TODO: Fade out to black maybe
call ASE_fnc_closeRespawnMap;