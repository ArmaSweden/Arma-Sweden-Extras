((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonDblClick", {
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