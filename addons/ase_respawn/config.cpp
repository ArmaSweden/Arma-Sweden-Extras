class CfgPatches
{
	class ASE_respawn
    {
		author = "SageNTitled of Arma Sweden";
		name = "ASE Respawn";
		url = "https://www.armasweden.se/";
		requiredAddons[] = {"A3_Modules_F"};
		requiredVersion = 0.1;
		units[] = {"ASE_ModuleCheckpoint"};
		weapons[] = {};
	};
};

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
    };
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;					// Default edit box (i.e., text input field)
			class Combo;				// Default combo box (i.e., drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};
		class ModuleDescription;
	};
	class ASE_ModuleCheckpoint: Module_F
	{
		scope = 2;
		displayName = "Checkpoint";
		icon = "Arma-Sweden-Extras\addons\ase_respawn\ui\icons\moduleCheckpoint.paa";
		category = "Multiplayer";
		function = "ASE_fnc_module_checkpoint";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 1;
		isDisposable = 0;
		is3DEN = 0;

		// Menu displayed when the module is placed or double-clicked on by Zeus
		curatorInfoType = "RscDisplayAttributeModuleCheckpoint"; // TODO: Remove?

		class Attributes: AttributesBase
		{
			class Side: Combo
			{
				property = "ASE_ModuleCheckpoint_Side";
				displayName = "Side";
				description = "Units of which side will be respawned at the position";
				class values
				{
					class Blufor
					{
						name = "BLUFOR";
						value = 0;
						default = 1;
					};
					class Opfor
					{
						name = "OPFOR";
						value = 1;
					};
					class Indfor
					{
						name = "INDFOR";
						value = 2;
					};
					class Civilian
					{
						name = "Civilian";
						value = 3;
					};
				};
			};
			class Name: Edit
			{
				property = "ASE_ModuleCheckpoint_Name";
				displayName = "Name";
				tooltip = "Respawn name visible in the respawn menu and on a map";
				defaultValue = """Checkpoint""";
			};
			class Time: Edit
			{
				property = "ASE_ModuleCheckpoint_Time";
				displayName = "Active time";
				tooltip = "Time in seconds that the respawn point will remain active (unlimited if 0)";
				defaultValue = """0""";
			};
			class Notification: Checkbox
			{
				property = "ASE_ModuleCheckpoint_Notification";
				displayName = "Display notification";
				tooltip = "Display a notification to units when respawn is activated";
				defaultValue = "false";
			};
			class RemovePrevious: Checkbox
			{
				property = "ASE_ModuleCheckpoint_RemovePrevious";
				displayName = "Remove previous";
				tooltip = "Remove previous checkpoints of the same side when this one is activated";
				defaultValue = "true";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description = "Creates a respawn point meant to be used as checkpoints when advancing in a scenario. Best used together with the Arma Sweden respawn templates.";
			sync[] = {"LocationArea_F"}; // TODO: Remove?
			position = 1;
			direction = 0;
			duplicate = 0;
		};
	};
};

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