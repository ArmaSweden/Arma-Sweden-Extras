class CfgPatches
{
	class ASE_common
	{
		author = "SageNTitled of Arma Sweden";
		name = "ASE Common";
		url = "https://www.armasweden.se/";
		requiredAddons[] = {};
		requiredVersion = 0.1;
		units[] = {};
		weapons[] = {};
	};
};

#include "CfgFunctions.hpp"

class Extended_PreInit_EventHandlers {
    ASE_Common_PreInit = "call compile preprocessFileLineNumbers 'Arma-Sweden-Extras\addons\ase_common\XEH_preInit.sqf'";
};