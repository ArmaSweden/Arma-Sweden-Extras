[
	"ASE_setting_markerTools_enabled",
	"CHECKBOX",
	["Enable marker tools", "Enables marker tools on the map."],
	["ASE Marker Tools", "Marker placement restrictions"],
	true
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementGlobal",
	"CHECKBOX",
	["Disable markers in global channel", "Disables placement of markers in the global channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementSide",
	"CHECKBOX",
	["Disable markers in side channel", "Disables placement of markers in the side channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementGroup",
	"CHECKBOX",
	["Disable markers in group channel", "Disables placement of markers in the group channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementVehicle",
	"CHECKBOX",
	["Disable markers in vehicle channel", "Disables placement of markers in the vehicle channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementCommand",
	"CHECKBOX",
	["Disable markers in command channel", "Disables placement of markers in the command channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementDirect",
	"CHECKBOX",
	["Disable markers in direct channel", "Disables placement of markers in the direct channel."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementBeforeStart",
	"CHECKBOX",
	["Disable markers in planning phase", "Disables placement of markers in the first map screen, before the game starts."],
	["ASE Marker Tools", "Marker placement restrictions"],
	false
] call CBA_fnc_addSetting;

[
	"ASE_setting_markerTools_disablePlacementRankException",
	"LIST",
	["Rank exception to marker restrictions", "Units with this rank or higher will be able to place markers despite restrictions."],
	["ASE Marker Tools", "Marker placement restrictions"],
	[
		["NONE", "PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"],
		["No exceptions", "Private", "Corporal", "Sergeant", "Lieutenant", "Captain", "Major", "Colonel"],
		0
	]
] call CBA_fnc_addSetting;

[] spawn {

	waitUntil {
		!isNull findDisplay 52 || !isNull findDisplay 53 || !isNull findDisplay 12
	};

	if (!isNull findDisplay 12) exitWith { };

	call ASE_fnc_initMarkerTools;

};

[] spawn {
	
	waitUntil {
		!isNull findDisplay 12
	};
	
	call ASE_fnc_initMarkerTools;
	
};

call ASE_fnc_disableMarkerPlacement;