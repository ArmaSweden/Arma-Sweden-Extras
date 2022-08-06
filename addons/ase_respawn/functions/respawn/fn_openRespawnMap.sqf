// TODO: Show inactive checkpoints
// TODO: Show respawn time if "Show respawn counter" is enabled
// TODO: Remove map markers under respawn markers

if (!hasInterface) exitWith {};

#define MARKER_SIZE 30
#define MARKER_SIZE_HOVER 38.5
#define MARKER_HITBOX_SIZE 0.05
#define MAP_ZOOM_SPEED 0.1
#define MAP_MAX_ZOOM 0

// TODO: Move to localNamespace
ASE_respawnPoints = [];
ASE_respawnMarkers = [];

[] spawn {
	// Create map
	_mapDisplay = (call BIS_fnc_displayMission) createDisplay "RscRespawnMapDisplay";
	_mapCtrl = _mapDisplay displayCtrl 182602;

	["Terminate"] call BIS_fnc_EGSpectator;

	if ("ASE_spectator" in getMissionConfigValue ["respawnTemplates", []]) then {
		// Open spectator when map is closed and if spectator respawn template is used
		_mapCtrl ctrlAddEventHandler ["Destroy", {
			if ((localNamespace getVariable ["ASE_selectedRespawnPoint", objNull]) isEqualTo objNull) then {
				[[blufor]] call ASE_fnc_openSpectator;
			};
		}];
		_mapDisplay displayAddEventHandler ["KeyDown", {
			params ["_display", "_key", "_shift", "_ctrl", "_alt"];
			if (_key == 50) then {
				[] spawn {
					[[blufor]] call ASE_fnc_openSpectator;
				};
				true
			};
		}];
	} else {
		_mapDisplay displayAddEventHandler ["KeyDown", {
			params ["_display", "_key", "_shift", "_ctrl", "_alt"];
			// Prevent closing display (open escape menu instead)
			if (_key == 1) then {
				[] spawn {
					// TODO: Add black background
					// TODO: Add event handler to reopen respawn map
					// TODO: This menu has "load" instead of "respawn" (probably singleplayer escape menu)
					(call BIS_fnc_displayMission) createDisplay "RscDisplayInterrupt";
				};
			};
			// Prevent opening map
			if (_key == 50) then {
				true
			};
		}];
	};

	call ASE_fnc_updateRespawnMarkers;

	// Draw respawn markers on map
	_mapCtrl ctrlAddEventHandler ["Draw", {
		params ["_mapCtrl"];
		_mapDisplay = ctrlParent _mapCtrl;
		{
			_markerCtrl = ASE_respawnMarkers select _forEachIndex;
			_markerIconCtrl = (allControls _markerCtrl) select 0;
			_respawnPos = [_x] call ASE_fnc_getRespawnPosition;
			_offset = [
				-(ctrlPosition _markerIconCtrl select 2) / 2,
				-(ctrlPosition _markerIconCtrl select 3) / 2
			];
			_markerPos = (_mapCtrl ctrlMapWorldToScreen _respawnPos) vectorAdd _offset;
			_markerPos deleteAt 2;

			_markerCtrl ctrlSetPosition _markerPos;
			_markerCtrl ctrlCommit 0;
		} forEach ASE_respawnPoints;
	}];

	// Main loop
	while {!isNull findDisplay 182600} do {
		call ASE_fnc_updateRespawnMarkers;
		sleep 0.05;
	};

	/* TODO: Add below event handlers to markers (or return true in event handlers to ignore interactions)
	_mapOverlayGroup ctrlAddEventHandler ["MouseButtonDown", {
		params ["_mapOverlayGroup", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

		_mapCtrl = (ctrlParent _mapOverlayGroup) displayCtrl 182602;

		hint str [_xPos, _yPos];

		ASE_isDraggingMap = true;
		ASE_mapDragCursorLastPosition = [_xPos, _yPos];
	}];

	_mapOverlayGroup ctrlAddEventHandler ["MouseButtonUp", {
		params ["_mapOverlayGroup", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

		ASE_isDraggingMap = false;
		ASE_mapDragCursorLastPosition = [];
	}];
	
	_mapOverlayGroup ctrlAddEventHandler ["MouseMoving", {
		params ["_mapOverlayGroup", "_xPos", "_yPos", "_mouseOver"];

		_mapCtrl = (ctrlParent _mapOverlayGroup) displayCtrl 182602;

		if (ASE_isDraggingMap) then {
			_deltaPos = [
				_xPos - (ASE_mapDragCursorLastPosition select 0),
				_yPos - (ASE_mapDragCursorLastPosition select 1)
			];
			_mapCenterPos = [safeZoneXAbs + safeZoneWAbs / 2, safeZoneY + safeZoneH / 2];
			_newPos = _mapCtrl ctrlMapScreenToWorld [
				(_mapCenterPos select 1) - (_deltaPos select 0),
				(_mapCenterPos select 1) - (_deltaPos select 1)
			];

			_mapCtrl ctrlMapAnimAdd [0, ctrlMapScale _mapCtrl, _newPos];
			ctrlMapAnimCommit _mapCtrl;

			ASE_mapDragCursorLastPosition = [_xPos, _yPos];
		};
	}];

	_mapOverlayGroup ctrlAddEventHandler ["MouseZChanged", {
		params ["_mapOverlayGroup", "_scroll"];

		_mapCtrl = (ctrlParent _mapOverlayGroup) displayCtrl 182602;
		_mapCenterPos = _mapCtrl ctrlMapScreenToWorld [safeZoneXAbs + safeZoneWAbs / 2, safeZoneY + safeZoneH / 2];
		
		// TODO: Zoom towards cursor position
		_mapCtrl ctrlMapAnimAdd [0, ((ctrlMapScale _mapCtrl) - (_scroll * MAP_ZOOM_SPEED * ctrlMapScale _mapCtrl)) max MAP_MAX_ZOOM, _mapCenterPos];
		ctrlMapAnimCommit _mapCtrl;
	}];
	*/
};