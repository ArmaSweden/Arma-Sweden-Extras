_interval = param [0, 0, [0]];

// Round to nearest interval
_newViewDistance = viewDistance + _interval;
_interval = abs _interval;
_newViewDistance = _newViewDistance / _interval;
_newViewDistance = round _newViewDistance;
_newViewDistance = _newViewDistance * _interval;
_newViewDistance = [_newViewDistance, _interval, 12000] call BIS_fnc_clamp;

setViewDistance _newViewDistance;

if (_interval > 0) then {
	systemChat format ["View distance increased to %1", viewDistance];
} else {
	if (_interval < 0) then {
		systemChat format ["View distance decreased to %1", viewDistance];
	} else {
		systemChat format "View distance is unchanged";
	};
};