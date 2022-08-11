params ["_markerCtrl", "_name"];

_textCtrl = (allControls _markerCtrl) select 1;
_respawnPoint = ASE_respawnPoints select (ASE_respawnMarkers find _markerCtrl);

if (_respawnPoint == -1) exitWith {};

_textCtrl ctrlSetText ([_markerCtrl, [_respawnPoint] call ASE_fnc_getRespawnName] call ASE_fnc_ctrlSetRespawnMarkerName);