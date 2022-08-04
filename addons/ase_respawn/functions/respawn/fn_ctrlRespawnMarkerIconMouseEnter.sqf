params ["_control"];

#define MARKER_WIDTH 5 * pixelW * pixelGrid
#define MARKER_HEIGHT 5 * pixelH * pixelGrid
#define MARKER_WIDTH_HOVER 7 * pixelW * pixelGrid
#define MARKER_HEIGHT_HOVER 7 * pixelH * pixelGrid
#define MARKER_PICTURE_SIZE_X 6 * pixelW * pixelGrid
#define MARKER_PICTURE_SIZE_Y 6 * pixelH * pixelGrid
#define MARKER_ICON_PADDING_X 0.5 * pixelW * pixelGrid
#define MARKER_ICON_PADDING_Y 0.5 * pixelH * pixelGrid
#define GAP 0.25 * pixelW * pixelGrid
#define TOOLTIP_HEIGHT 7 * pixelH * pixelGrid
#define TOOLTIP_MIN_WIDTH 15 * pixelW * pixelGrid
#define TOOLTIP_PADDING 0.3 * pixelW * pixelGrid
#define SCROLLBAR_KILLER 0.000001

#define COLOR_BACKGROUND_HOVER [0, 0, 0, 1]

_iconCtrl = ctrlParentControlsGroup _control;
_markerCtrl = ctrlParentControlsGroup _iconCtrl;
_iconBackgroundCtrl = (allControls _iconCtrl) select 0;
_iconPictureCtrl = (allControls _iconCtrl) select 1;
_iconTriggerCtrl = (allControls _iconCtrl) select 2;
_tooltipCtrl = (allControls _markerCtrl) select 4;
_tooltipBackgroundCtrl = (allControls _tooltipCtrl) select 0;
_tooltipNameCtrl = (allControls _tooltipCtrl) select 1;

_markerCtrl ctrlSetPosition [
	ctrlPosition _markerCtrl select 0,
	ctrlPosition _markerCtrl select 1,
	MARKER_WIDTH_HOVER + ((ctrlTextWidth _tooltipNameCtrl) max TOOLTIP_MIN_WIDTH) + TOOLTIP_PADDING * 2 + GAP + SCROLLBAR_KILLER,
	MARKER_HEIGHT_HOVER
];
_markerCtrl ctrlCommit 0;
ctrlSetFocus _markerCtrl;

{
	_x ctrlSetPosition [
		0,
		0,
		MARKER_WIDTH_HOVER,
		MARKER_HEIGHT_HOVER
	];
	_x ctrlCommit 0;
} forEach [_iconCtrl, _iconBackgroundCtrl, _iconTriggerCtrl];

_iconBackgroundCtrl ctrlSetBackgroundColor COLOR_BACKGROUND_HOVER;

_iconPictureCtrl ctrlSetPosition [
	MARKER_ICON_PADDING_X,
	MARKER_ICON_PADDING_Y,
	MARKER_PICTURE_SIZE_X,
	MARKER_PICTURE_SIZE_Y
];
_iconPictureCtrl ctrlCommit 0;

_tooltipCtrl ctrlSetPosition [
	MARKER_WIDTH_HOVER + GAP,
	0,
	(ctrlTextWidth _tooltipNameCtrl) max TOOLTIP_MIN_WIDTH + TOOLTIP_PADDING * 2,
	TOOLTIP_HEIGHT
];
_tooltipCtrl ctrlSetFade 0;
_tooltipCtrl ctrlShow true;
_tooltipCtrl ctrlEnable true;
_tooltipCtrl ctrlCommit 0;

_tooltipBackgroundCtrl ctrlSetPosition [
	ctrlPosition _tooltipBackgroundCtrl select 0,
	ctrlPosition _tooltipBackgroundCtrl select 1,
	(ctrlTextWidth _tooltipNameCtrl) max TOOLTIP_MIN_WIDTH + TOOLTIP_PADDING * 2,
	ctrlPosition _tooltipBackgroundCtrl select 3
];
_tooltipBackgroundCtrl ctrlCommit 0;

_tooltipNameCtrl ctrlSetPosition [
	ctrlPosition _tooltipNameCtrl select 0,
	ctrlPosition _tooltipNameCtrl select 1,
	ctrlTextWidth _tooltipNameCtrl,
	ctrlPosition _tooltipNameCtrl select 3
];
_tooltipNameCtrl ctrlCommit 0;