private _mapDisplay = nil;
if (!isNull(finddisplay 12)) then {
	_mapDisplay = (finddisplay 12);
};
if (!isNull(findDisplay 52)) then {
	_mapDisplay = (finddisplay 52);
};
if (!isNull(findDisplay 53)) then {
	_mapDisplay = findDisplay 53;
};

if (isNull(_mapDisplay displayCtrl 172601)) then {
	[] call ASE_fnc_openMarkerTools;
} else {
	[] call ASE_fnc_closeMarkerTools;
};