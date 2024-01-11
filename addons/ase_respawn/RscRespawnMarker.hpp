class RscRespawnMarker: RscControlsGroup
{
	idc = -1;
	x = safeZoneWAbs / 2;
	y = safeZoneH / 2;
	w = 5 * pixelW * pixelGrid;
	h = 5 * pixelH * pixelGrid;
	class Controls
	{
		class RscRespawnMarkerIcon: RscControlsGroup
		{
			idc = -1;
			x = 0;
			y = 0;
			w = 5 * pixelW * pixelGrid;
			h = 5 * pixelH * pixelGrid;
			class Controls
			{
				class RscRespawnMarkerIconBackground: RscText
				{
					idc = -1;
					x = 0;
					y = 0;
					w = 5 * pixelW * pixelGrid;
					h = 5 * pixelH * pixelGrid;
					colorBackground[] = C_COLOR_BACKGROUND;
				};
				class RscRespawnMarkerIconPicture: RscPicture
				{
					idc = -1;
					x = 0.5 * pixelW * pixelGrid;
					y = 0.5 * pixelH * pixelGrid;
					w = 4 * pixelW * pixelGrid;
					h = 4 * pixelH * pixelGrid;
					text = "A3\ui_f\data\IGUI\RscTitles\MPProgress\respawn_ca.paa";
				};
				class RscRespawnMarkerIconTrigger: RscButton
				{
					idc = -1;
					x = 0;
					y = 0;
					w = 5 * pixelW * pixelGrid;
					h = 5 * pixelH * pixelGrid;
					colorBackground[] = {0, 0, 0, 0};
					colorBackgroundActive[] = {0, 0, 0, 0};
					colorFocused[] = {0, 0, 0, 0};
					onMouseEnter = "[_this select 0] call ASE_fnc_ctrlRespawnMarkerIconMouseEnter";
					onMouseExit = "[_this select 0] call ASE_fnc_ctrlRespawnMarkerIconMouseExit";
					onMouseButtonClick = "_this call ASE_fnc_ctrlRespawnMarkerIconMouseButtonClick";
				};
			};
		};
		class RscRespawnMarkerTooltip: RscControlsGroup
		{
			idc = -1;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			fade = 1;
			class Controls
			{
				class RscRespawnMarkerTooltipBackground: RscText
				{
					idc = -1;
					x = 0;
					y = 0;
					w = 20 * pixelW * pixelGrid;
					h = 7 * pixelH * pixelGrid;
					colorBackground[] = C_COLOR_BACKGROUND;
				};
				class RscRespawnMarkerTooltipName: RscText
				{
					x = 0.3 * pixelW * pixelGrid;
					y = 0.3 * pixelH * pixelGrid;
					colorShadow[] = {0, 0, 0, 0};
					text = "Respawn point";
					font = "RobotoCondensed";
					sizeEx = 4 * pixelW * pixelGrid;
				};
			};
		};
	};
};