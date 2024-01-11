// TODO: List incompatible templates

params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

localNamespace setVariable ["ASE_isReadyToRespawn", false];
localNamespace setVariable ["ASE_selectedRespawnPoint", objNull];

if (_respawnDelay < 5) then {
	setPlayerRespawnTime 5;
} else {
	setPlayerRespawnTime _respawnDelay;
};

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

waitUntil { (localNamespace getVariable ["ASE_selectedRespawnPoint", objNull]) isNotEqualTo objNull };

if ("ASE_spectator" in getMissionConfigValue ["respawnTemplates", []]) then {
	["Terminate"] call BIS_fnc_EGSpectator;
};
setPlayerRespawnTime 0;
// TODO: Fade out to black maybe
call ASE_fnc_closeRespawnMap;