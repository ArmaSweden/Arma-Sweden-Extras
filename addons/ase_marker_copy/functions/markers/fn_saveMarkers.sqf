private _markers = [];

{
	_markers pushBack [
		markerText _x,
		markerPos _x,
		markerDir _x,
		markerType _x,
		markerColor _x
	];
} forEach allMapMarkers;

profileNamespace setVariable ["ASE_savedMarkers", _markers];