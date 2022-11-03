params ["_display", "_key", "_shift", "_ctrl", "_alt"];

_ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
if (_ranks find rank player >= ASE_setting_markerTools_disablePlacementRankException) exitWith {};

_isActionRestricted = false;

// Restrict deleting marker
if (_key == 211) then {

	_control = _display displayCtrl 51;
	_marker = ctrlMapMouseOver _control;
	if (_marker select 0 == "marker") then {

		_isActionRestricted = [(_marker select 1)] call ASE_fnc_isMarkerRestricted;

	};

};

// Restrict polylines
if (_key == 29 && [currentChannel] call ASE_fnc_isChannelRestricted ) then { _isActionRestricted = true; };

_isActionRestricted