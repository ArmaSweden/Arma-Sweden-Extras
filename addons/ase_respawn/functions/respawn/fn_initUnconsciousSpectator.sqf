params ["_unit", "_state"];

if (_unit != player) exitWith {};

if (_state) then {

	[] spawn {

		// Disable ACE screen effects
		ppEffectDestroy ace_medical_feedback_ppUnconsciousBlackout;
		ppEffectDestroy ace_medical_feedback_ppUnconsciousBlur;

		// Flag in case player changes unconscious state multiple times in succession
		localNamespace setVariable ["ASE_isBootingUnconsciousSpectator", true];

		sleep 4;
		cutText ["", "BLACK OUT", 0.25];
		sleep 1;

		_side = [objNull];
		_canSpectateOthers = false;
		switch (ASE_setting_respawn_unconsciousSpectatorList) do {
			case 1: {
				_side = [side group player];
				_canSpectateOthers = true;
			};
			case 2: {
				_side = [];
				_canSpectateOthers = true;
			};
		};

		["Initialize", [player, _side, ASE_setting_respawn_enableUnconsciousSpectateAI, false, true, false, false, false, false, _canSpectateOthers]] call BIS_fnc_EGSpectator;

		sleep 0.5;

		// Force spectate player's unconscious body
		if (ASE_setting_respawn_unconsciousSpectatorList isEqualTo 0) then {
			missionNamespace setVariable ["BIS_EGSpectator_whitelistedSides", [objNull]];
			uiNamespace setVariable ["RscEGSpectator_focus", player];
			["SetCameraMode", ["follow"]] call BIS_fnc_EGSpectatorCamera;
		};

		cutText ["","BLACK IN"];

		localNamespace setVariable ["ASE_isBootingUnconsciousSpectator", false];

	};

} else {

	call ASE_fnc_closeUnconsciousSpectator;

};