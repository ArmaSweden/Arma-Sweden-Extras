// TODO: Initialize with same settings since last spectator session

if (!hasInterface) exitWith {};
waitUntil { !isNil { player } && { !isNull player } };
// TODO: Check if already open

params ["_side"];

[_side] spawn {
	params ["_side"];

	["Initialize", [player, _side, false, false, true, true, true, false, false, true]] call BIS_fnc_EGSpectator;

	if ("ASE_position" in getMissionConfigValue ["respawnTemplates", []]) then {
		// Wait until spectator display is created
		waitUntil { findDisplay 60492 != displayNull };
		sleep 0.1;
		_spectatorDisplay = findDisplay 60492;
		_spectatorDisplay displayAddEventHandler ["KeyDown", {
			params ["_display", "_key", "_shift", "_ctrl", "_alt"];
			// Open respawn map when pressing M
			if (_key == 50) then {
				[] spawn {
					[] call ASE_fnc_openRespawnMap;
				};
			};
			// Open escape menu
			if (_key == 1) then {
				[] spawn {
					// TODO: Add event handler to reopen spectator
					(call BIS_fnc_displayMission) createDisplay "RscDisplayInterrupt";
				};
			};
			true
		}];

		// Create respawn button
		_respawnPromptCtrl = _spectatorDisplay ctrlCreate ["RscRespawnPromptGroup", 182610];
		_respawnPromptCtrl ctrlSetFade 1;
		_respawnPromptCtrl ctrlCommit 0;
		_respawnPromptButtonCtrl = _spectatorDisplay displayCtrl 182611;
		_respawnPromptButtonCtrl ctrlSetStructuredText parseText "<t size='0.9' color='#99ffffff'>NO ACTIVE RESPAWNS&#160;&#160;</t><br/><t size='0.5' color='#99ffffff' font='PuristaMedium'>Press M to open map</t>";
		_respawnPromptCtrl ctrlSetFade 0;
		_respawnPromptCtrl ctrlCommit 0.5;
		
		// Change button content when player is able to respawn
		waitUntil { localNamespace getVariable ["ASE_isReadyToRespawn", false] };
		_respawnPromptButtonCtrl ctrlSetStructuredText parseText "<t size='0.9'>RESPAWN IS AVAILABLE&#160;&#160;</t><br/><t size='0.5' color='#99ffffff' font='PuristaMedium'>Press M to see all respawn positions</t>";
		// TODO: Change colors and picture
	};
};