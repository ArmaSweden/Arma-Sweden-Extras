_markers = profileNamespace getVariable "ASE_savedMarkers";

{
	if ((_x splitString "|") select 0 == "POLYLINE") then {

		_x splitString "|" params [
			"",
			"_name",
			"_path",
			"_color"
		];

		_name splitString "#/" params [
			"",
			"",
			"_markerID",
			"_channelID"
		];

		_marker = createMarkerLocal [
			format ["_USER_DEFINED #%1/%2/%3", getPlayerID player, _markerID, _channelID],
			[0, 0],
			parseNumber _channelID,
			player
		];
		_marker setMarkerPolylineLocal parseSimpleArray _path;
		_marker setMarkerColor _color;

	} else {

		_x splitString "|" params [
			"_name",
			"_pos",
			"_type",
			"_dir",
			"_color",
			"_alpha",
			"_text"
		];

		_name splitString "#/" params [
			"",
			"",
			"_markerID",
			"_channelID"
		];

		// Load to group channel if singleplayer
		if (!isMultiplayer) then {
			_channelID = "3";
		};

		_marker = createMarkerLocal [
			format ["_USER_DEFINED #%1/%2/%3", getPlayerID player, _markerID, _channelID],
			parseSimpleArray _pos,
			parseNumber _channelID,
			player
		];
		_marker setMarkerTypeLocal _type;
		_marker setMarkerDirLocal parseNumber _dir;
		_marker setMarkerColorLocal _color;
		_marker setMarkerAlphaLocal parseNumber _alpha;
		_marker setMarkerText _text;
		
	};

} forEach _markers;