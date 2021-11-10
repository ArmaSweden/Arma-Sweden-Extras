private _mapDisplay = nil;
if (!isNull(finddisplay 12)) then { _mapDisplay = (finddisplay 12) } else { _mapDisplay = (finddisplay 52) };

if (isNull(_mapDisplay displayCtrl 172601)) then {
	[] call ASE_fnc_openMarkerTools;
} else {
	[] call ASE_fnc_closeMarkerTools;
};