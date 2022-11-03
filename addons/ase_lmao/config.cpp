class CfgPatches
{
	class ASE_lmao
    {
		author = "SageNTitled of Arma Sweden";
		name = "ASE LMAO";
		url = "https://www.armasweden.se/";
		requiredAddons[] = {"cba_common", "ace_interaction"};
		requiredVersion = 0.1;
		units[] = {};
		weapons[] = {};
	};
};

#include "CfgFunctions.hpp"

class Extended_PreInit_EventHandlers {
    ASE_Lmao_PreInit = "call compile preprocessFileLineNumbers 'Arma-Sweden-Extras\addons\ase_lmao\XEH_preInit.sqf'";
};