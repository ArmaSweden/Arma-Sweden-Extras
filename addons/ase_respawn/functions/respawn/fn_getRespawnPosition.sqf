params ["_respawnPoint"];

private ["_position"];

switch (typeName _respawnPoint) do {
	case "ARRAY": {
		_position = _respawnPoint;
	};
	case "STRING": {
		_position = markerPos _respawnPoint;
	};
	case "OBJECT": {
		_position = getPos _respawnPoint;
	};
	default {
		systemChat format ["ase_respawn: Could not determine respawn type of: %1", _respawnPoint];
		diag_log format ["ase_respawn: Could not determine respawn type of: %1", _respawnPoint];
		_position = false;
	};
};

_position