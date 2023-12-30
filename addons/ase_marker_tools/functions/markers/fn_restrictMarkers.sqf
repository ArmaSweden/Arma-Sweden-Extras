if (!isMultiplayer) exitWith {};

_mapDisplay = call ASE_fnc_getMapDisplay;

(_mapDisplay displayCtrl 51) ctrlAddEventHandler ["MouseButtonDblClick", {

	params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

	_ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
	if (_ranks find rank player >= ASE_setting_markerTools_disablePlacementRankException) exitWith {};

	// IDs for marker placement window
	//
	// Display: 54
	// 1000
	// 1 = OK button
	// 2 = CANCEL button
	// 1001 = window header
	// 1100 = description section
	// 1101 = channel section
	// 102 = MarkerPicture
	// 101 = text field
	// 103 = channel dropdown
	// 1211 = timestamp text
	// 1210 = timestamp checkbox
	// 1220 = marker dropdown
	// 1221 = color dropdown
	// 1230 = direction slider
	// 1231 = direction text
	// 1240 = scale slider
	// 1241 = scale text

	// Restrict marker placement
	[_control] spawn {

		params ["_control"];

		disableserialization;
		_display = displayNull;
		_timeout = diag_tickTime + 5;

		waitUntil {_display = findDisplay 54; (!isNull _display || (diag_tickTime > _timeout))};

		if (!isNull _display) then {

			// Restrict editing marker
			_marker = ctrlMapMouseOver _control;
			if (_marker select 0 == "marker") then {

				if ([(_marker select 1)] call ASE_fnc_isMarkerRestricted) exitWith { _display closeDisplay 0 };

			};

			// Current channel is restricted
			if ([currentChannel] call ASE_fnc_isChannelRestricted) exitWith { _display closeDisplay 0 };

			_channelControl = _display displayCtrl 103;

			// Remove ACE event handler for setting current channel (will set incorrect channel when deleting items otherwise)
			_channelControl ctrlRemoveAllEventHandlers "LBSelChanged";

			if ([4] call ASE_fnc_isChannelRestricted) then { _channelControl lbDelete 4 };
			if ([3] call ASE_fnc_isChannelRestricted) then { _channelControl lbDelete 3 };
			if ([2] call ASE_fnc_isChannelRestricted) then { _channelControl lbDelete 2 };
			if ([1] call ASE_fnc_isChannelRestricted) then { _channelControl lbDelete 1 };
			if ([0] call ASE_fnc_isChannelRestricted) then { _channelControl lbDelete 0 };

			for "_i" from 0 to (lbSize _channelControl - 1) do {

				if ((parseNumber (_channelControl lbData _i)) isEqualTo currentChannel) exitWith {

					systemChat format ["data is %1", (_channelControl lbData _i)];
					systemChat format ["setting to %1", _i];
					_channelControl lbSetCurSel _i;

				};

			};

			// Add back event handler for setting current channel again
			_channelControl ctrlAddEventHandler ["LBSelChanged", { 
				
				params ["_ctrl", "_index"];

				_enabledChannels = false call ace_markers_fnc_getEnabledChannels;

				// Get channel ID from lbData instead of index like in ace_markers_fnc_onLBSelChangedChannel
				setCurrentChannel (_enabledChannels select parseNumber (_ctrl lbData _index));

			}];

		};

	};
	
}];

if (_mapDisplay == findDisplay 12) then {
	
	_mapDisplay displayAddEventHandler ["KeyDown", { _this call ASE_fnc_onMapKeyDown }];
	(_mapDisplay displayCtrl 51) ctrlAddEventHandler ["MouseButtonDown", { _this call ASE_fnc_onMapMouseButtonDown }];

	// Without this, players can draw one polyline before the restriction takes effect
	ctrlSetFocus (_mapDisplay displayCtrl 51);

} else {
	
	_mapDisplay displayAddEventHandler ["KeyDown", { _this call ASE_fnc_onMapKeyDown }];
	(_mapDisplay displayCtrl 51) ctrlAddEventHandler ["MouseButtonDown", { _this call ASE_fnc_onMapMouseButtonDown }];

};

// Workaround to make self interaction possible when Ctrl key is blocked by restricted channels
["ace_interactMenuOpened", {
	
	if (!alive player || !visibleMap) exitWith {};
	[1] call ACE_interact_menu_fnc_keyDown;

}] call CBA_fnc_addEventHandler;