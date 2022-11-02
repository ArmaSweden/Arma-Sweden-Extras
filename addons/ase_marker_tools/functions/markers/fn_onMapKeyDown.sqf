params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];

_ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
if (_ranks find rank player >= ASE_setting_markerTools_disablePlacementRankException) exitWith {};

// Restrict polylines
_key == 29 && { [currentChannel] call ASE_fnc_isChannelRestricted }