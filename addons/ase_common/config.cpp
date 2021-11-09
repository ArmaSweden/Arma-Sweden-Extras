class CfgPatches {
	class ASE_common {
		author = "SageNTitled of Arma Sweden";
		name = "Arma 3 - User Interface";
		url = "";
		requiredAddons[] = {};
		requiredVersion = 0.100000;
		units[] = {};
		weapons[] = {};
	};
};

class CfgMarkers {
	class Flag {
		name = "$STR_CFG_MARKERS_FLAG";
		icon = "A3\ui_f\data\map\markers\military\circle_CA.paa";
		color[] = {1, 0, 0, 1};
		size = 32;
		shadow = 1;
		scope = 0;
	};
    	class ASE_flag_Sweden: Flag {
		name = "Sweden";
		icon = "Arma-Sweden-Extras\addons\ASE_common\flag_sweden.paa";
		texture = "Arma-Sweden-Extras\addons\ASE_common\flag_sweden.paa";
		size = 36;
		scope = 1;
		shadow = 0;
		color[] = {1, 1, 1, 1};
		markerClass = "Flags";
	};
};
