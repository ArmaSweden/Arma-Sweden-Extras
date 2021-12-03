private _mapDisplay = call ASE_fnc_getMapDisplay;

if (isNull(_mapDisplay displayCtrl 172601)) then {
	[] call ASE_fnc_openMarkerTools;
} else {
	[] call ASE_fnc_closeMarkerTools;
};