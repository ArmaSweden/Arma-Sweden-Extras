params ["_control"];

#define COLOR_BACKGROUND [0, 0, 0, 0.7]

_iconCtrl = ctrlParentControlsGroup _control;
_markerCtrl = ctrlParentControlsGroup _iconCtrl;
_iconBackgroundCtrl = (allControls _iconCtrl) select 0;
_iconPictureCtrl = (allControls _iconCtrl) select 1;
_iconTriggerCtrl = (allControls _iconCtrl) select 2;
_tooltipCtrl = (allControls _markerCtrl) select 4;

_markerCtrl ctrlSetPosition [
	ctrlPosition _markerCtrl select 0,
	ctrlPosition _markerCtrl select 1,
	5 * pixelW * pixelGrid,
	5 * pixelH * pixelGrid
];
_markerCtrl ctrlCommit 0;

{
	_x ctrlSetPosition [
		0,
		0,
		5 * pixelW * pixelGrid,
		5 * pixelH * pixelGrid
	];
	_x ctrlCommit 0;
} forEach [_iconCtrl, _iconBackgroundCtrl, _iconTriggerCtrl];

_iconBackgroundCtrl ctrlSetBackgroundColor COLOR_BACKGROUND;

_iconPictureCtrl ctrlSetPosition [
	0.5 * pixelW * pixelGrid,
	0.5 * pixelW * pixelGrid,
	4 * pixelW * pixelGrid,
	4 * pixelH * pixelGrid
];
_iconPictureCtrl ctrlCommit 0;

_tooltipCtrl ctrlSetFade 1;
_tooltipCtrl ctrlSetPosition [
	0,
	0,
	0,
	0
];
_tooltipCtrl ctrlShow false;
_tooltipCtrl ctrlEnable false;
_tooltipCtrl ctrlCommit 0;