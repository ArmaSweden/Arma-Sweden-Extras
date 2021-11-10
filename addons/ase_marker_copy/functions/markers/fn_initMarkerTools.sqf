[] spawn {

	waitUntil {
		if (!isNull findDisplay 12) exitWith {};
		!isNull findDisplay 52
	};

	[] call ASE_fnc_initMarkerToolsDisplay;

};

[] spawn {

	waitUntil {
		!isNull findDisplay 12
	};
	
	[] call ASE_fnc_initMarkerToolsDisplay;
	
};

ASE_fnc_initMarkerToolsDisplay = {

	// TODO: Check if already initialized
	// TODO: Should run in map screen (before mission start) and in multiplayer (only runs in single player atm)
	// TODO: Tweak offset if ACE is loaded (maybe not necessary since it's only the center icon that is removed)

	// ID:s
	// 2302 = ctrlGroup
	// 	111 = name
	// 	1014 = rank background
	//	116 = rank icon
	//	1205 = first divider
	//	1090 = color picker
	//	1091 = shape picker
	//	1202 = move map to player position icon
	//	1201 = toggle map texture icon
	//	1204 = second divider
	//	101 = time

	#define SHIFT_X 0.060121

	private _mapDisplay = nil;
	if (!isNull(finddisplay 12)) then { _mapDisplay = (finddisplay 12) } else { _mapDisplay = (finddisplay 52) };

	private _mapToolGroup = (_mapDisplay displayCtrl 2302);
	private _divider1 = (_mapDisplay displayCtrl 1205);
	private _colorPicker = (_mapDisplay displayCtrl 1090);
	private _shapePicker = (_mapDisplay displayCtrl 1091);
	private _centerIcon = (_mapDisplay displayCtrl 1202);
	private _mapTextureIcon = (_mapDisplay displayCtrl 1201);
	private _divider2 = (_mapDisplay displayCtrl 1204);
	private _clock = (_mapDisplay displayCtrl 101);

	_mapToolGroup ctrlSetPosition [
		(ctrlPosition _mapToolGroup select 0) - SHIFT_X, // Shift to the left
		(ctrlPosition _mapToolGroup select 1),
		(ctrlPosition _mapToolGroup select 2) + SHIFT_X, // Increase width to match
		(ctrlPosition _mapToolGroup select 3)
	];

	_divider1 ctrlSetPosition [
		(ctrlPosition _divider1 select 0) + SHIFT_X, // Shift to the right
		(ctrlPosition _divider1 select 1)
	];

	_colorPicker ctrlSetPosition [
		(ctrlPosition _colorPicker select 0) + SHIFT_X, // Shift to the right
		(ctrlPosition _colorPicker select 1)
	];

	_shapePicker ctrlSetPosition [
		(ctrlPosition _shapePicker select 0) + SHIFT_X, // Shift to the right
		(ctrlPosition _shapePicker select 1)
	];

	_centerIcon ctrlSetPosition [
		(ctrlPosition _centerIcon select 0) + SHIFT_X, // Shift to the right
		(ctrlPosition _centerIcon select 1)
	];

	_mapTextureIcon ctrlSetPosition [
		(ctrlPosition _mapTextureIcon select 0) + SHIFT_X, // Shift to the right
		(ctrlPosition _mapTextureIcon select 1)
	];

	_divider2 ctrlSetPosition [
		(ctrlPosition _divider2 select 0) + SHIFT_X, // Shift to the right
		(ctrlPosition _divider2 select 1)
	];

	_clock ctrlSetPosition [
		(ctrlPosition _clock select 0) + SHIFT_X, // Shift to the right
		(ctrlPosition _clock select 1)
	];

	_mapToolGroup ctrlCommit 1;
	_divider1 ctrlCommit 1;
	_colorPicker ctrlCommit 1;
	_shapePicker ctrlCommit 1;
	_centerIcon ctrlCommit 1;
	_mapTextureIcon ctrlCommit 1;
	_divider2 ctrlCommit 1;
	_clock ctrlCommit 1;

	// Create custom controls
	// TODO: Put button inside _mapToolGroup to avoid not being able to click when group is focused
	private _markerToolButton = _mapDisplay ctrlCreate ["RscMarkerToolButton", 172600];
	_markerToolButton ctrlSetFade 1;
	_markerToolButton ctrlCommit 0;

	waitUntil { ctrlCommitted _clock };

	_markerToolButton ctrlSetFade 0;
	_markerToolButton ctrlCommit 1;

	player globalChat "marker tools initialized";

};