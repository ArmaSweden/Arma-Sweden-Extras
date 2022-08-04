class RscRespawnPromptGroup: RscControlsGroup
{
	idc = 182610;
	x = safezoneX + (safezoneW / 2) - 21 * pixelW * pixelGrid;
	y = safezoneY;
	w = 42 * pixelW * pixelGrid;
	h = 9 * pixelH * pixelGrid;
	class ControlsBackground
	{

	};
	class Controls
	{
		class RscRespawnPromptButton: RscButtonMenu
		{
			idc = 182611;
			x = 0;
			y = 0;
			w = 42 * pixelW * pixelGrid;
			h = 9 * pixelH * pixelGrid;
			text = "OPEN MAP";
			size = "((((safezoneW / safezoneH) min 2.5) / 1) / 23)";
			textureNoShortcut = "A3\ui_f\data\IGUI\RscTitles\MPProgress\respawn_ca.paa"; // TODO: Change to checkpoint icon
			colorFocused[] = {
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
				1
			};
			color2[] = {
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
				1
			};
			colorBackground[] = COLOR_BACKGROUND;
			colorBackgroundFocused[] = COLOR_BACKGROUND_HOVER;
			colorBackground2[] = COLOR_BACKGROUND_HOVER;
			onButtonClick = "[] call ASE_fnc_openRespawnMap";
			class Attributes
			{
				font = "RobotoCondensed";
			};
			class TextPos
			{
				left = 10 * pixelW * pixelGrid;
				top = 1 * pixelH * pixelGrid;
				right = 2 * pixelW * pixelGrid;
				bottom = 1 * pixelH * pixelGrid;
			};
			class ShortcutPos
			{
				left = 2 * pixelW * pixelGrid;
				top = 1 * pixelH * pixelGrid;
				w = 6 * pixelW * pixelGrid;
				h = 6 * pixelH * pixelGrid;
			};
		};
	};
};