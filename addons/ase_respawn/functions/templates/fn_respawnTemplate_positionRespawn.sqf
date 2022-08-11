// TODO: List incompatible templates

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if (!((localNamespace getVariable ["ASE_selectedRespawnPoint", objNull]) isEqualTo objNull)) then {
	[player, localNamespace getVariable "ASE_selectedRespawnPoint"] call BIS_fnc_moveToRespawnPosition;
};

setPlayerRespawnTime _respawnDelay;