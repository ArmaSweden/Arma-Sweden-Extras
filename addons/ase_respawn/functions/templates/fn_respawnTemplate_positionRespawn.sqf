// TODO: List incompatible templates

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

[player, localNamespace getVariable "ASE_selectedRespawnPoint"] call BIS_fnc_moveToRespawnPosition;
setPlayerRespawnTime _respawnDelay;