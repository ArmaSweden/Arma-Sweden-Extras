class CfgPatches
{
	class ASE_vehicles
    {
		author = "SageNTitled of Arma Sweden";
		name = "ASE Vehicles";
		url = "https://www.armasweden.se/";
		requiredAddons[] = {"cup_trackedvehicles_leopard2"};
		requiredVersion = 0.100000;
		units[] = {};
		weapons[] = {};
	};
};

class CfgFactionClasses
{
	class ASE_B_Sweden
	{
		displayName = "Swedish Armed Forces";
		author = "SageNTitled of Arma Sweden";
		icon = "";
		priority = 1;
		side = 1;
	};
};

class CfgEditorSubcategories
{
	class ASE_B_Sweden_tanks
	{
		displayName = "Tanks";
	};
};

class CfgVehicles
{
	class CUP_B_Leopard2A6_GER;
	class ASE_B_Strv122 : CUP_B_Leopard2A6_GER
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "Strv 122";
		side = 1;
		faction = "ASE_B_Sweden";
		editorSubcategory = "ASE_B_Sweden_tanks";
		hiddenSelectionsTextures[] = {"Arma-Sweden-Extras\addons\ase_vehicles\data\hull.jpg", "Arma-Sweden-Extras\addons\ase_vehicles\data\turret.jpg"};
		enginePower = 100000; // TODO: Remove
	};
};