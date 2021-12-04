private _markers = [];

{
	// Marker must be created by a player
	if (!(["_USER_DEFINED", _x, true] call BIS_fnc_inString)) then {continue};

	_playerID = (_x splitString "#/") select 1;

	// Marker must be owned by the player
	if (_playerID != getPlayerID player) then { continue };

	if (markerShape _x == "POLYLINE") then {

		_markers pushBack ([
			"POLYLINE",
			_x,
			markerPolyline _x,
			markerColor _x
		] joinString "|");

	} else {
		
		_markers pushBack ([
			_x,
			markerPos _x,
			markerType _x,
			markerDir _x,
			markerColor _x,
			markerAlpha _x,
			markerText _x
		] joinString "|");
		
	};

} forEach allMapMarkers;

profileNamespace setVariable ["ASE_savedMarkers", _markers];