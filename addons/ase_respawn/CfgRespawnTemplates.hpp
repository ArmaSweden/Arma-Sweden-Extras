class CfgRespawnTemplates
{
	class ASE_position
	{
		displayName = "ASE Position";
		onPlayerKilled = "Arma-Sweden-Extras\addons\ase_respawn\functions\templates\fn_respawnTemplate_positionKilled.sqf";
		onPlayerRespawn = "Arma-Sweden-Extras\addons\ase_respawn\functions\templates\fn_respawnTemplate_positionRespawn.sqf";
		respawnTypes[] = {3};
	};
	class ASE_spectator
	{
		displayName = "ASE Spectator";
		onPlayerKilled = "Arma-Sweden-Extras\addons\ase_respawn\functions\templates\fn_respawnTemplate_spectatorKilled.sqf";
		onPlayerRespawn = "Arma-Sweden-Extras\addons\ase_respawn\functions\templates\fn_respawnTemplate_spectatorRespawn.sqf";
		respawnTypes[] = {3};
	};
};