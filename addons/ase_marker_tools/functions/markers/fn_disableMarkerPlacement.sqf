if (!isMultiplayer) exitWith {};

// TODO: Make work on first map screen
// TODO: Disable moving markers (ACE)

((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonDblClick", {

	// IDs
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

	// global
	// side
	// command
	// group
	// vehicle
	// direct

	_ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
	if (_ranks find rank player >= ASE_setting_markerTools_disablePlacementRankException) exitWith {};

	[] spawn {

		disableserialization;
		_display = displayNull;
		_timeout = diag_tickTime + 5;

		waitUntil {_display = findDisplay 54; (!isNull _display || (diag_tickTime > _timeout))};

		if (!isNull _display) then {

			_isChannelDisabled = [
				ASE_setting_markerTools_disablePlacementGlobal,
				ASE_setting_markerTools_disablePlacementSide,
				ASE_setting_markerTools_disablePlacementCommand,
				ASE_setting_markerTools_disablePlacementGroup,
				ASE_setting_markerTools_disablePlacementVehicle
			];

			if (_isChannelDisabled find false == -1) exitWith {

				_display closeDisplay 0;

			};

			_channelControl = _display displayCtrl 103;
			
			if (ASE_setting_markerTools_disablePlacementVehicle) then { _channelControl lbDelete 4 };
			if (ASE_setting_markerTools_disablePlacementGroup) then { _channelControl lbDelete 3 };
			if (ASE_setting_markerTools_disablePlacementCommand) then { _channelControl lbDelete 2 };
			if (ASE_setting_markerTools_disablePlacementSide) then { _channelControl lbDelete 1 };
			if (ASE_setting_markerTools_disablePlacementGlobal) then { _channelControl lbDelete 0 };

			if (_isChannelDisabled select (currentChannel)) then {

				_channelControl lbSetCurSel 0;

			} else {

				for "_i" from 0 to (lbSize _channelControl - 1) do {

					if ((parseNumber (_channelControl lbData _i)) isEqualTo currentChannel) exitWith {

						_channelControl lbSetCurSel _i;

					};

				};
				
			};

		};

	};
	
}];

