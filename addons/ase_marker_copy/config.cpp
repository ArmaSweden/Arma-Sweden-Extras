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
            class copyMarkers {};
            class pasteMarkers {};
        };
    };
};

class RscButton;

class RscMarkerToolsDisplay
{
	idd = 172600;
	class ControlsBackground
	{

	};
	class Controls
	{
		class RscMarkerToolButton: RscButton
		{
			idc = 172601;
			text = "M"; //--- ToDo: Localize;
			x = safezoneW + safezoneX - 0.7;
			y = safezoneY + 0.01;
			w = 0.05;
			h = 0.05;
			tooltip = "Open marker tools"; //--- ToDo: Localize;
		};
	};
};