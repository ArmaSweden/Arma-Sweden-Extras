private _mapDisplay = nil;
if (!isNull(finddisplay 12)) then { _mapDisplay = (finddisplay 12) } else { _mapDisplay = (finddisplay 52) };

if (isNull(_mapDisplay displayCtrl 172601)) exitWith {};

private _markerToolsGroup = _mapDisplay displayCtrl 172601;
ctrlDelete _markerToolsGroup;