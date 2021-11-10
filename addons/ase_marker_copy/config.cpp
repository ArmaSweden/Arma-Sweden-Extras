class CfgPatches
{
	class ASE_markerCopy
    {
		author = "SageNTitled of Arma Sweden";
		name = "ASE Marker Copy";
		url = "https://www.armasweden.se/";
		requiredAddons[] = {"A3_ui_f"}; // Just picked something
		requiredVersion = 0.100000;
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
    class ASE
    {
        tag = "ASE";

        class markers
        {
            file = "Arma-Sweden-Extras\addons\ase_marker_copy\functions\markers";
			class initDisplay {
				postInit = 1;
			};
            class saveMarkers {};
            class loadMarkers {};
        };
    };
};

class RscButton;
class RscControlsGroup;

class RscMarkerToolButton: RscButton
{
	idc = 172600;
	text = "M";
	x = safezoneW + safezoneX - 0.493;
	y = safezoneY + 0.003;
	w = 0.05;
	h = 0.05;
	tooltip = "Open marker tools";
};

class RscMarkerToolsGroup: RscControlsGroup
{
	idc = 172601;
	x = safezoneW + safezoneX - 0.493;
	y = safezoneY + 0.07;
	w = 0.2;
	h = 0.1;
	class ControlsBackground
	{
		
	};
	class Controls
	{
		class RscMarkerSaveButton: RscButton
		{
			idc = 172603;
			text = "S";
			x = 0;
			y = 0;
			w = 0.05;
			h = 0.05;
			tooltip = "Save markers";
		};
		class RscMarkerLoadButton: RscButton
		{
			idc = 172604;
			text = "L";
			x = 0.055;
			y = 0;
			w = 0.05;
			h = 0.05;
			tooltip = "Load markers";
		};
	};
};