if (!isClass(configFile >> "CfgPatches" >> "tfar_core")) exitWith {
	diag_log "ASE: Attempting to disable Auto Stop Yelling, but TFAR is not loaded";
};

["ASE_autoStopYelling", "OnSpeakVolume", player] call TFAR_fnc_removeEventHandler;