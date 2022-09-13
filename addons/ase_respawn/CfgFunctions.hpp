class CfgFunctions
{
    class ASE_respawn
    {
        tag = "ASE";

        class Modules
        {
            file = "Arma-Sweden-Extras\addons\ase_respawn\functions\modules";
            class module_checkpoint {};
        };
		class Templates
		{
			file = "Arma-Sweden-Extras\addons\ase_respawn\functions\templates";
			class respawnTemplate_positionKilled {};
			class respawnTemplate_positionRespawn {};
			class respawnTemplate_spectatorKilled {};
			class respawnTemplate_spectatorRespawn {};
		};
		class Respawn
		{
			file = "Arma-Sweden-Extras\addons\ase_respawn\functions\respawn";
			class openRespawnMap {};
            class closeRespawnMap {};
			class openSpectator {};
			class ctrlRespawnMarkerIconMouseEnter {};
			class ctrlRespawnMarkerIconMouseExit {};
			class ctrlRespawnMarkerIconMouseButtonClick {};
			class ctrlExpandRespawnMarkerTooltip {};
			class updateRespawnMarkers {};
			class getRespawnPosition {};
			class getRespawnName {};
			class ctrlSetRespawnMarkerName {};
			class initUnconsciousSpectator {};
		};
    };
};