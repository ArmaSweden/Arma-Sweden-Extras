// TODO: Initialize with same settings since last spectator session
// TODO: Show respawn time if "Show respawn counter" is enabled
// TODO: Spectate everyone when mission has no respawn, or tickets have run out

if (!hasInterface) exitWith {};
waitUntil { !isNil { player } && { !isNull player } };
// TODO: Check if already open

params ["_side"];

[_side] spawn {
	params ["_side"];

	// Open EG Spectator
	if (["IsInitialized"] call BIS_fnc_EGSpectator) exitWith { diag_log "ASE: Attempting to open spectator when it already initialized." };

	["Initialize", [player, _side, false, false, true, true, true, false, false, true]] call BIS_fnc_EGSpectator;

	if ("ASE_position" in getMissionConfigValue ["respawnTemplates", []]) then {
		// Wait until spectator display is created
		waitUntil { findDisplay 60492 != displayNull };
		sleep 0.1; // Required, as display still doesn't exist yet for some reason
		_spectatorDisplay = findDisplay 60492;
		_spectatorDisplay displayAddEventHandler ["KeyDown", {
			params ["_display", "_key", "_shift", "_ctrl", "_alt"];

			// Open respawn map when pressing M
			if (_key == 50) then {
				call ASE_fnc_openRespawnMap;
				true
			};
		}];

		// Create respawn button
		_respawnPromptCtrl = _spectatorDisplay ctrlCreate ["RscRespawnPromptGroup", 182610];
		_respawnPromptCtrl ctrlSetFade 1;
		_respawnPromptCtrl ctrlCommit 0;
		_respawnPromptIconCtrl = _spectatorDisplay displayCtrl 182612;
		_respawnPromptIconCtrl ctrlEnable false;
		_respawnPromptTextCtrl = _spectatorDisplay displayCtrl 182613;
		_respawnPromptTextCtrl ctrlSetStructuredText parseText "<t color='#99ffffff'>NO ACTIVE RESPAWNS&#160;&#160;</t><br/><t size='0.6' color='#99ffffff' font='PuristaMedium'>Press M to open map</t>";
		_respawnPromptTextCtrl ctrlEnable false;
		_respawnPromptTimerCtrl = _spectatorDisplay displayCtrl 182614;
		_respawnPromptTimerCtrl ctrlSetStructuredText parseText format ["%1", [playerRespawnTime, "MM:SS"] call BIS_fnc_secondsToString];
		_respawnPromptTimerCtrl ctrlEnable false;
		_respawnPromptCtrl ctrlSetFade 0;
		_respawnPromptCtrl ctrlCommit 0.5;

		while {!(localNamespace getVariable ["ASE_isReadyToRespawn", false])} do {
			_respawnPromptTimerCtrl ctrlSetStructuredText parseText format ["%1", [playerRespawnTime, "MM:SS"] call BIS_fnc_secondsToString];
			sleep 1;
		};
		
		// Change button content when player is able to respawn
		_respawnPromptTextCtrl ctrlSetStructuredText parseText "RESPAWN IS AVAILABLE&#160;&#160;<br/><t size='0.6' color='#99ffffff' font='PuristaMedium'>Press M to see all respawn positions</t>";
		_respawnPromptTimerCtrl ctrlSetStructuredText parseText "00:00";
		// TODO: Change colors and picture
	};
};