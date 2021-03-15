class CfgPatches {
	class ASE_music {
		author = "SageNTitled";
		name = "ASE Music";
		url = "";
		requiredAddons[] = {};
		requiredVersion = 0.100000;
		units[] = {};
		weapons[] = {};
	};
};

class CfgMusicClasses {
	class ASE {
		displayName = "ASE";
	};
};

class CfgMusic {
	class Trailer {
		name = "Trailer";
		sound[] = {"\ASE_music\music\trailer.ogg",1,1};
		theme = "Calm";
		duration = "85";
		musicClass = "ASE";
	};
};