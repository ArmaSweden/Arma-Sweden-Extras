[] spawn {

	waitUntil {
		!isNull findDisplay 52 || !isNull findDisplay 53 || !isNull findDisplay 12
	};

	if (!isNull findDisplay 12) exitWith { };

	call ASE_fnc_initMarkerTools;

};

[] spawn {
	
	waitUntil {
		!isNull findDisplay 12
	};
	
	call ASE_fnc_initMarkerTools;
	
};

call ASE_fnc_disableMarkerPlacement;