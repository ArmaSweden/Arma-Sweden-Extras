params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];

// Restrict polylines
_key == 29 && { [currentChannel] call ASE_fnc_isChannelRestricted }