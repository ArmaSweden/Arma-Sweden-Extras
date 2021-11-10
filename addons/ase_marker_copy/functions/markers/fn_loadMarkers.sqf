_markers = profileNamespace getVariable "ASE_savedMarkers";

{
	_x params ["_text", "_pos", "_dir", "_type", "_color"];

	_marker = createMarker [str _pos, _pos];
	_marker setMarkerText _text;
	_marker setMarkerDir _dir;
	_marker setMarkerType _type;
	_marker setMarkerColor _color;
} forEach _markers;