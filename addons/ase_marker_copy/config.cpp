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

        class Markers
        {
            file = "Arma-Sweden-Extras\addons\ase_marker_copy\functions\markers";
			class initMarkerTools {
				preInit = 1;
			};
            class saveMarkers {};
            class loadMarkers {};
			class openMarkerTools {};
			class closeMarkerTools {};
			class toggleMarkerTools {};
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
	tooltip = "Marker tools";
	onButtonClick = "[] call ASE_fnc_toggleMarkerTools";
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
			idc = 172602;
			text = "S";
			x = 0;
			y = 0;
			w = 0.05;
			h = 0.05;
			tooltip = "Save markers";
			onButtonClick = "[] call ASE_fnc_saveMarkers";
		};
		class RscMarkerLoadButton: RscButton
		{
			idc = 172603;
			text = "L";
			x = 0.055;
			y = 0;
			w = 0.05;
			h = 0.05;
			tooltip = "Load markers";
			onButtonClick = "[] call ASE_fnc_loadMarkers";
		};
	};
};