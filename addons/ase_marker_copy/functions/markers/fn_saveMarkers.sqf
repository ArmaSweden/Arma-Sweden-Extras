private _markers = [];

{
	if (!(["_USER_DEFINED", _x, true] call BIS_fnc_inString)) then {continue};
	// TODO: Check if player is owner of marker
	_markers pushBack [_x call BIS_fnc_markerToString];
} forEach allMapMarkers;

profileNamespace setVariable ["ASE_savedMarkers", _markers];