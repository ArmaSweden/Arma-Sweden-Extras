class RscRespawnMapDisplay
{
	idd = 182600;
	x = safeZoneXAbs;
	y = safeZoneY;
	w = safeZoneWAbs;
	h = safeZoneH;
	class ControlsBackground
	{
		class RscRespawnMapBackgroundControl: RscText
		{
			idc = 182601;
			x = safeZoneXAbs;
			y = safeZoneY;
			w = safeZoneWAbs;
			h = safeZoneH;
			text = "";
			colorBackground[] = {1, 1, 1, 1};
		};
		class RscRespawnMapControl: RscMapControl
		{
			idc = 182602;
			x = safeZoneXAbs;
			y = safeZoneY;
			w = safeZoneWAbs;
			h = safeZoneH;
		};
	};
	class Controls
	{
		
	};
};