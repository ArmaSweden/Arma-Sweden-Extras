class CfgPatches
{
	class ASE_respawn
    {
		author = "SageNTitled of Arma Sweden";
		name = "ASE Respawn";
		url = "https://www.armasweden.se/";
		requiredAddons[] = {"A3_ui_f", "A3_Modules_F", "cba_common", "ace_medical"};
		requiredVersion = 0.1;
		units[] = {"ASE_ModuleCheckpoint"};
		weapons[] = {};
	};
};

#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "CfgRespawnTemplates.hpp"
#include "defines.hpp"
#include "RscRespawnMap.hpp"
#include "RscRespawnMarker.hpp"
#include "RscRespawnPrompt.hpp"

class Extended_PreInit_EventHandlers {
    ASE_Respawn_PreInit = "call compile preprocessFileLineNumbers 'Arma-Sweden-Extras\addons\ase_respawn\XEH_preInit.sqf'";
};

class Extended_PostInit_EventHandlers {
    ASE_Respawn_PostInit = "call compile preprocessFileLineNumbers 'Arma-Sweden-Extras\addons\ase_respawn\XEH_postInit.sqf'";
};