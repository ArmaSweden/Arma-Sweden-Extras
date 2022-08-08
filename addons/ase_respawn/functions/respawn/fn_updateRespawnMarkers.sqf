// Get respawn points
_respawnPoints = ((side group player) call BIS_fnc_getRespawnMarkers) + (player call BIS_fnc_getRespawnPositions);
_newRespawnPoints = [];
_oldRespawnPoints = [];

if (count ASE_respawnPoints > 0) then {
	_intersect = _respawnPoints arrayIntersect ASE_respawnPoints;
	_oldRespawnPoints = ASE_respawnPoints - _intersect;
	_newRespawnPoints = _respawnPoints - _intersect;
} else {
	_newRespawnPoints = _respawnPoints;
};

// Remove expired markers
{
	if (_oldRespawnPoints find _x != -1) then {
		ctrlDelete (ASE_respawnMarkers select 0);
		ASE_respawnMarkers deleteAt _forEachIndex;
		ASE_respawnPoints deleteAt _forEachIndex;
		if (_x isEqualTo (localNamespace getVariable ["ASE_selectedRespawnPoint", objNull])) then {
			localNamespace setVariable ["ASE_selectedRespawnPoint", objNull];
		};
	};
} forEach ASE_respawnPoints;

// Create new markers
{
	_markerCtrl = _mapDisplay ctrlCreate ["RscRespawnMarker", -1];
	_textCtrl = (allControls _markerCtrl) select 6;
	_textCtrl ctrlSetText ([_x] call ASE_fnc_getRespawnName);
	ASE_respawnMarkers pushBack (_markerCtrl);
	ASE_respawnPoints pushBack _x;
} forEach _newRespawnPoints;