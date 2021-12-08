if (!isMultiplayer) exitWith {};

((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonDblClick", {

	_ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
	if (_ranks find rank player >= ASE_setting_markerTools_disablePlacementRankException) exitWith {};

	if (currentChannel == 0 && !ASE_setting_markerTools_disablePlacementGlobal) exitWith {};
	if (currentChannel == 1 && !ASE_setting_markerTools_disablePlacementSide) exitWith {};
	if (currentChannel == 2 && !ASE_setting_markerTools_disablePlacementCommand) exitWith {};
	if (currentChannel == 3 && !ASE_setting_markerTools_disablePlacementGroup) exitWith {};
	if (currentChannel == 4 && !ASE_setting_markerTools_disablePlacementVehicle) exitWith {};
	if (currentChannel == 5 && !ASE_setting_markerTools_disablePlacementDirect) exitWith {};

	[] spawn {
		disableserialization;
		_display = displayNull;
		_timeout = diag_tickTime + 5;
		waitUntil {_display = uiNamespace getVariable ["RscDisplayInsertMarker", displayNull]; (!isNull _display || (diag_tickTime > _timeout))};
		if(!isNull _display) then {
			_display closeDisplay 0;
		};
	};
}];

// TODO: Edit ACE channel select list
// TODO: Remove display if no channels are allowed