if (!isClass(configFile >> "CfgPatches" >> "tfar_core")) exitWith {

	diag_log "ASE: Attempting to enable Auto Stop Yelling, but TFAR is not loaded";

};

["ASE_autoStopYelling", "OnSpeakVolume", {

	params ["_unit", "_speakingDistance"];

	if (_speakingDistance <= 20) exitWith {};

	if (localNamespace getVariable ["ASE_yellingTime", 0] > 0) exitWith {

		localNamespace setVariable ["ASE_yellingTime", time];

	};

	localNamespace setVariable ["ASE_yellingTime", time];

	[] spawn {

		waitUntil { time > (localNamespace getVariable ["ASE_yellingTime", 0]) + ASE_setting_common_autoStopYellingTime };

		if (TF_speak_volume_meters <= 20) exitWith { localNamespace setVariable ["ASE_yellingTime", 0] };

		_normalVolume = 20;

		private _localName = "STR_tfar_core_voice_normal";
		TF_last_speak_volume_level = TF_speak_volume_level;
		TF_last_speak_volume_meters = TF_speak_volume_meters;
		TF_speak_volume_meters = TF_max_voice_volume min _normalVolume;
		if (TF_speak_volume_meters <= 5) then {

			TF_speak_volume_level = "Whispering";
			_localName = "STR_tfar_core_voice_whispering";

		} else {

			if (TF_speak_volume_meters > 20) then {

				TF_speak_volume_level = "Yelling";
				_localName = STR_tfar_core_voice_yelling;
				
			} else {

				TF_speak_volume_level = "Normal";
				_localName = "STR_tfar_core_voice_normal";

			};

		};

		if (TFAR_oldVolumeHint) then { 

			private _hintText = format[localize "STR_tfar_core_voice_volume", localize _localName]; 
			[parseText (_hintText), 5] call TFAR_fnc_showHint; 

		} else { 

			if (!TFAR_ShowVolumeHUD) then { 

				("tfar_core_HUDVolumeIndicatorRsc" call BIS_fnc_rscLayer) cutRsc ["tfar_core_HUDVolumeIndicatorRsc", "PLAIN", 0, true]; 
				TFAR_volumeIndicatorFlashIndex = TFAR_volumeIndicatorFlashIndex + 1; 
				[{

					if (TFAR_volumeIndicatorFlashIndex == _this select 0) then { 

						("tfar_core_HUDVolumeIndicatorRsc" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

					};

				}, [TFAR_volumeIndicatorFlashIndex], 5] call CBA_fnc_waitAndExecute; 

			};
		}; 
		call TFAR_fnc_updateSpeakVolumeUI;

		["OnSpeakVolume", [TFAR_currentUnit, TF_speak_volume_meters]] call TFAR_fnc_fireEventHandlers;

		localNamespace setVariable ["ASE_yellingTime", 0];

	}

}, player] call TFAR_fnc_addEventHandler;