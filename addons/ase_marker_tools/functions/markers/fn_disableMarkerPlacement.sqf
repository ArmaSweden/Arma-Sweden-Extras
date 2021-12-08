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

	_ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
	if (_ranks find rank player >= ASE_setting_markerTools_disablePlacementRankException) exitWith {};

	[] spawn {

		disableserialization;
		_display = displayNull;
		_timeout = diag_tickTime + 5;

		waitUntil {_display = findDisplay 54; (!isNull _display || (diag_tickTime > _timeout))};

		if (!isNull _display) then {

			if (ASE_setting_markerTools_disablePlacementVehicle &&
			ASE_setting_markerTools_disablePlacementGroup &&
			ASE_setting_markerTools_disablePlacementCommand &&
			ASE_setting_markerTools_disablePlacementSide &&
			ASE_setting_markerTools_disablePlacementGlobal) exitWith {
				_display closeDisplay 0;
			};

			_channelList = _display displayCtrl 103;
			if (ASE_setting_markerTools_disablePlacementVehicle) then { _channelList lbDelete 4 };
			if (ASE_setting_markerTools_disablePlacementGroup) then { _channelList lbDelete 3 };
			if (ASE_setting_markerTools_disablePlacementCommand) then { _channelList lbDelete 2 };
			if (ASE_setting_markerTools_disablePlacementSide) then { _channelList lbDelete 1 };
			if (ASE_setting_markerTools_disablePlacementGlobal) then { _channelList lbDelete 0 };

			// TODO: Select first element if current selection is empty

		};

	};
	
}];

