if (!hasInterface) exitWith {};

_eventID = ["ace_interaction_tapShoulder", ASE_fnc_onTapShoulder] call CBA_fnc_addEventHandler;
localNamespace setVariable ["ASE_judoTapEventID", _eventID];