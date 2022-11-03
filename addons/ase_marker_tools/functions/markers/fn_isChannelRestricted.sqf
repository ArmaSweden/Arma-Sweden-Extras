params ["_channelID"];

_isChannelRestricted = [
	ASE_setting_markerTools_disablePlacementGlobal,
	ASE_setting_markerTools_disablePlacementSide,
	ASE_setting_markerTools_disablePlacementCommand,
	ASE_setting_markerTools_disablePlacementGroup,
	ASE_setting_markerTools_disablePlacementVehicle
];

if (_channelID == -1) exitWith {
	_isChannelRestricted find false == -1
};

_isChannelRestricted select _channelID