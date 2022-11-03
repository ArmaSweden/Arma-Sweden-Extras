// TODO: Mark if settings require restart

[
	"ASE_setting_markerTools_enabled",
	"CHECKBOX",
	["Enable marker tools", "Enables marker tools on the map."],
	["ASE Marker Tools"],
	true,
	nil,
	{},
	true
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementGlobal",
	"CHECKBOX",
	["Disable markers in global channel", "Disables placement of markers in the global channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false,
	nil,
	{},
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementSide",
	"CHECKBOX",
	["Disable markers in side channel", "Disables placement of markers in the side channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false,
	nil,
	{},
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementGroup",
	"CHECKBOX",
	["Disable markers in group channel", "Disables placement of markers in the group channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false,
	nil,
	{},
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementVehicle",
	"CHECKBOX",
	["Disable markers in vehicle channel", "Disables placement of markers in the vehicle channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false,
	nil,
	{},
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementCommand",
	"CHECKBOX",
	["Disable markers in command channel", "Disables placement of markers in the command channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false,
	nil,
	{},
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementRankException",
	"LIST",
	["Rank exception to marker restrictions", "Units with this rank or higher will be able to place markers despite restrictions."],
	["ASE Marker Tools", "Marker placement restrictions"],
	[
		[10, 0, 1, 2, 3, 4, 5, 6],
		["No exceptions", "Private", "Corporal", "Sergeant", "Lieutenant", "Captain", "Major", "Colonel"],
		0
	],
	nil,
	{},
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_restrictPlacementBeforeStart",
	"CHECKBOX",
	["Restrictions apply in planning phase", "Markers are restricted in the planning map screen, before the game starts."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false,
	nil,
	{},
	true
] call CBA_fnc_addSetting;

// Trigger on planning phase
[] spawn {

	waitUntil { !isNull findDisplay 52 || !isNull findDisplay 53 || !isNull findDisplay 12 };

	if (!isNull findDisplay 12) exitWith { };
	
	if (ASE_setting_markerTools_enabled) then {
		call ASE_fnc_initMarkerTools;
	};

	if (ASE_setting_markerTools_restrictPlacementBeforeStart) then {
		call ASE_fnc_restrictMarkers;
	};

};

// Trigger on game phase
[] spawn {
	
	waitUntil { !isNull findDisplay 12 };
	
	if (ASE_setting_markerTools_enabled) then {
		call ASE_fnc_initMarkerTools;
	};
	
	call ASE_fnc_restrictMarkers;
	
};