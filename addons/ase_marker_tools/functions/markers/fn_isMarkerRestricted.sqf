_marker = param [0, "", [""]];

_markerChannel = parseNumber (_marker regexFind ["(?!\/)\d+$"] select 0 select 0 select 0);
[_markerChannel] call ASE_fnc_isChannelRestricted