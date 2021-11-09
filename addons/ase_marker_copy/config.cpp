class CfgPatches
{
	class ASE_markerCopy
    {
		author = "SageNTitled of Arma Sweden";
		name = "ASE Marker Copy";
		url = "https://www.armasweden.se/";
		requiredAddons[] = {"ace_common"};
		requiredVersion = 0.100000;
		units[] = {};
		weapons[] = {};
	};
};

class CfgVehicles
{
    class Man;
    class CAManBase : Man
    {
        class ACE_SelfActions
        {
            class copyMarkers
            {
                displayName = "Copy markers";
                condition = "true";
                exceptions[] = {};
                statement = "hint 'copy markers'";
            };
            class pasteMarkers
            {
                displayName = "Paste markers";
                condition = "true";
                exceptions[] = {};
                statement = "hint 'paste markers'";
            };
        };
    };
};

class CfgFunctions
{
    class ASE_functions
    {
        tag = "ASE";

        class Markers
        {
            file = "Arma-Sweden-Extras\addons\ase_marker_copy\functions\markers";
            class copyMarkers {};
            class pasteMarkers {};
        };
    };
};