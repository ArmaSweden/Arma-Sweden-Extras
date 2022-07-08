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
    class ASE
    {
        tag = "ASE";

        class Modules
        {
            file = "Arma-Sweden-Extras\addons\ase_respawn\functions\modules";
            class moduleCheckpoint {};
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
		// Description base classes, for more information see below
		class ModuleDescription
		{
			class AnyBrain;
		};
	};
	class ASE_ModuleCheckpoint: Module_F
	{
		scope = 2;
		displayName = "Checkpoint";
		icon = ""; // TODO: Add checkpoint icon
		category = "Multiplayer";
		function = "ASE_fnc_moduleCheckpoint";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 1;
		isDisposable = 0;
		is3DEN = 0;

		// Menu displayed when the module is placed or double-clicked on by Zeus
		curatorInfoType = "RscDisplayAttributeModuleCheckpoint"; // TODO: Remove?

		class Attributes: AttributesBase
		{
			class Units: Units
			{
				property = "ASE_ModuleCheckpoint_Units";
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
				tooltip = "Time until the respawn point is disabled again (unlimited if 0)";
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
				tooltip = "Remove previous checkpoints when this one is activated";
				defaultValue = "true";
			};
			class ModuleDescription: ModuleDescription{}; // Module description should be shown last
		};

		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Short module description";
			sync[] = {"LocationArea_F"}; // Array of synced entities (can contain base classes)

			class LocationArea_F
			{
				description[] = { // Multi-line descriptions are supported
					"First line",
					"Second line"
				};
				position = 1; // Position is taken into effect
				direction = 1; // Direction is taken into effect
				optional = 1; // Synced entity is optional
				duplicate = 1; // Multiple entities of this type can be synced
				synced[] = {"BLUFORunit","AnyBrain"}; // Pre-define entities like "AnyBrain" can be used. See the list below
			};
			class BLUFORunit
			{
				description = "Short description";
				displayName = "Any BLUFOR unit"; // Custom name
				icon = "iconMan"; // Custom icon (can be file path or CfgVehicleIcons entry)
				side = 1; // Custom side (will determine icon color)
			};
		};
	};
};