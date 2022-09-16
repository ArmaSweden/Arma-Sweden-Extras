params ["_unit", "_state"];

if (_unit != player) exitWith {};

if (_state) then {

	[] spawn {

		// Flag in case player changes unconscious state multiple times in succession
		localNamespace setVariable ["ASE_isBootingUnconsciousSpectator", true];

		sleep 4;
		cutText ["", "BLACK OUT", 0.25];
		sleep 1;
		["Initialize", [player, [objNull], false, false, true, false, false, false, false, false]] call BIS_fnc_EGSpectator;
		sleep 0.5;
		missionNamespace setVariable ["BIS_EGSpectator_whitelistedSides", objNull];
		uiNamespace setVariable ["RscEGSpectator_focus", player];
		["SetCameraMode", ["follow"]] call BIS_fnc_EGSpectatorCamera;
		// TODO: Remove ACE effects
		cutText ["","BLACK IN"];

		localNamespace setVariable ["ASE_isBootingUnconsciousSpectator", false];

	};

} else {

	call ASE_fnc_closeUnconsciousSpectator;

};