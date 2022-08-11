params ["_markerIconTriggerCtrl", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

_markerIconCtrl = ctrlParentControlsGroup _markerIconTriggerCtrl;
_markerCtrl = ctrlParentControlsGroup _markerIconCtrl;

// TODO: Change appearance of selected marker

_index = ASE_respawnMarkers find _markerCtrl;
localNamespace setVariable ["ASE_selectedRespawnPoint", ASE_respawnPoints select _index];