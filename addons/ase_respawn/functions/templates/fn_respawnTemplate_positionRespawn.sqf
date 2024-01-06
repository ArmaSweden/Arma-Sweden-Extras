// TODO: List incompatible templates

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if (!((localNamespace getVariable ["ASE_selectedRespawnPoint", objNull]) isEqualTo objNull)) then {
	[player, localNamespace getVariable "ASE_selectedRespawnPoint"] call BIS_fnc_moveToRespawnPosition;
};

if (_respawnDelay < 5) then {
	setPlayerRespawnTime 5;
} else {
	setPlayerRespawnTime _respawnDelay;
};