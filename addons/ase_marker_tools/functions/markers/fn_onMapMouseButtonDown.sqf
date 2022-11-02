params ["_displayOrControl", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

// Restrict moving marker
_marker = ctrlMapMouseOver _displayOrControl;
if (_marker select 0 == "marker") then {
	_markerChannel = parseNumber ((_marker select 1) regexFind ["(?!\/)\d+$"] select 0 select 0 select 0);
	if (_button == 0 && _alt && [_markerChannel] call ASE_fnc_isChannelRestricted) exitWith { true };
};