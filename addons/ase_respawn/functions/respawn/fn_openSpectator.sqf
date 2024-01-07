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
	if (["IsInitialized"] call BIS_fnc_EGSpectator) then {
		if ((["GetDisplay"] call BIS_fnc_EGSpectator) isEqualTo displayNull) then {
			["CreateDisplay"] call BIS_fnc_EGSpectator;
		};
	} else {
		["Initialize", [player, _side, false, false, true, true, true, false, false, true]] call BIS_fnc_EGSpectator;
	};

	if ("ASE_position" in getMissionConfigValue ["respawnTemplates", []]) then {
		// Wait until spectator display is created
		waitUntil { findDisplay 60492 != displayNull };
		sleep 0.1; // Required, as display still doesn't exist yet for some reason
		_spectatorDisplay = findDisplay 60492;
		_spectatorDisplay displayAddEventHandler ["KeyDown", {
			params ["_display", "_key", "_shift", "_ctrl", "_alt"];

			_return = false;

			// Open respawn map when pressing M
			if (_key == 50) then {
				[] spawn {
					[] call ASE_fnc_openRespawnMap;
				};
				_return = true;
			};

			// TODO: Maybe not needed after respawn map fix (closing only spectator controls instead of reinitializing spectator)
			// Don't open escape menu if respawn map is open
			// Prevents visual glitch when closing respawn map with esc
			if (_key == 1) then {
				if (findDisplay 182600 isNotEqualTo displayNull) then {
					_return = true;
				};
			};

			_return
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