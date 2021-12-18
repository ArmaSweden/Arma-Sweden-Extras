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
		icon = ""; // TODO: Add icon
		priority = 1;
		side = 1;
	};
};

class CfgVehicleClasses
{
	class ASE_B_Sweden_tanks
	{
		displayName = "Tanks";
	};
};

class CfgEditorSubcategories
{
	class ASE_Eden_tanks
	{
		displayName = "Tanks";
	};
};

class CfgVehicles
{
	class CUP_B_Leopard2A6_GER;
	class CUP_B_Leopard2A6_GER_import : CUP_B_Leopard2A6_GER { class EventHandlers; };
	class ASE_B_Strv122 : CUP_B_Leopard2A6_GER_import
	{
		scope = 0;
		scopeCurator = 0;
		vehicleClass = "ASE_B_Sweden_tanks";
		class EventHandlers: EventHandlers
		{
			init = "if (local (_this select 0)) then { [(_this select 0), """", [], false] call BIS_fnc_initVehicle; };";
		};
		class textureSources
		{
			class M90_Woodland
			{
				displayName = "M90 Woodland";
				author = "SageNTitled of Arma Sweden";
				textures[] = { // TODO: Make PAA
					"Arma-Sweden-Extras\addons\ase_vehicles\data\hull.jpg",
					"Arma-Sweden-Extras\addons\ase_vehicles\data\turret.jpg",
					"Arma-Sweden-Extras\addons\ase_vehicles\data\wheels.jpg"
				};
				factions[] = { "ASE_B_Sweden" };
			};
		};
	};
	class ASE_B_Strv122_SWE : ASE_B_Strv122
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "Strv 122 (Woodland)";
		textureList[] = {
			"M90_Woodland", 1
		};
		side = 1;
		faction = "ASE_B_Sweden";
		editorSubcategory = "ASE_Eden_tanks";
	};
};