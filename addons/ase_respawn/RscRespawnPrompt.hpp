class RscRespawnPromptGroup: RscControlsGroup
{
	idc = 182610;
	x = safezoneX + (safezoneW / 2) - 21 * pixelW * pixelGrid;
	y = safezoneY;
	w = 50 * pixelW * pixelGrid;
	h = 9 * pixelH * pixelGrid;
	class HScrollbar
	{
		height = 0;
		shadow = 0;
	};
	class Controls
	{
		class RscBackground: RscText
		{
			idc = 182611;
			x = 0;
			y = 0;
			w = 50 * pixelW * pixelGrid;
			h = 9 * pixelH * pixelGrid;
			colorBackground[] = C_COLOR_BACKGROUND;
			text = "";
		};
		class RscRespawnPromptIcon: RscPicture
		{
			idc = 182612;
			x = 2 * pixelW * pixelGrid;
			y = 1.5 * pixelH * pixelGrid;
			w = 6 * pixelW * pixelGrid;
			h = 6 * pixelH * pixelGrid;
			text = "\A3\ui_f\data\IGUI\RscTitles\MPProgress\respawn_ca.paa";
		};
		class RscRespawnPromptText: RscStructuredText
		{
			idc = 182613;
			x = 9 * pixelW * pixelGrid;
			y = 1.5 * pixelH * pixelGrid;
			w = 29 * pixelW * pixelGrid;
			h = 6 * pixelH * pixelGrid;
			style = ST_LEFT;
			text = "Respawn text";
			size = "4.5 * pixelGrid * pixelW";
			shadow = 0;
			class Attributes
			{
				font = "RobotoCondensed";
			};
		};
		class RscRespawnPromptTimer: RscStructuredText
		{
			idc = 182614;
			x = 38 * pixelW * pixelGrid;
			y = 2 * pixelH * pixelGrid;
			w = 10 * pixelW * pixelGrid;
			h = 5 * pixelH * pixelGrid;
			style = ST_CENTER;
			text = "00:00";
			size = "6 * pixelGrid * pixelW";
			shadow = 0;
			class Attributes
			{
				font = "RobotoCondensed";
			};
		};
		class RscRespawnPromptButton: RscButton
		{
			idc = 182615;
			x = 0;
			y = 0;
			w = 50 * pixelW * pixelGrid;
			h = 9 * pixelH * pixelGrid;
			colorBackground[] = C_COLOR_TRANSPARENT;
			colorBackgroundDisabled[] = C_COLOR_TRANSPARENT;
			colorBackgroundActive[] = C_COLOR_TRANSPARENT;
			colorFocused[] = C_COLOR_TRANSPARENT;
			/*
			colorFocused[] = {
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
				1
			};
			*/
			borderSize = 0;
			onMouseEnter = "_this call ASE_fnc_onRespawnPromptMouseEnter";
			onMouseExit = "_this call ASE_fnc_onRespawnPromptMouseExit";
			onButtonClick = "[] call ASE_fnc_openRespawnMap";
		};
	};
};