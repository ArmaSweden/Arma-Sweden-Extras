_markers = profileNamespace getVariable "ASE_savedMarkers";

{
	_x call BIS_fnc_stringToMarker;
} forEach _markers;