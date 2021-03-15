class CfgPatches {

	class ASE_replacementSounds {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"SAM_AK5"};
	};
};

/*extern*/ class Mode_SemiAuto;
/*extern*/ class Mode_FullAuto;

class CfgWeapons {
    
	/*extern*/ class Rifle;

	class Rifle_Base_F: Rifle {
		/*extern*/ class WeaponSlotsInfo;
		/*extern*/ class GunParticles;
	};
    
	class SAM_AK5_BASE: Rifle_Base_F {

		class Single: Mode_SemiAuto {
            
			class BaseSoundModeType {
				//weaponSoundEffect = "DefaultRifle";
				//closure1 = {"A3\sounds_f\weapons\closure\closure_rifle_6", 1.412538, 1, 10};
				//closure2 = {"A3\sounds_f\weapons\closure\closure_rifle_7", 1.412538, 1, 10};
				//soundClosure = {"closure1", 0.500000, "closure2", 0.500000};
			};
            
			class StandardSound: BaseSoundModeType {
				begin1[] = {"\ASE_replacementSounds\sound\pew", 5, 1, 1200};
				soundBegin[] = {"begin1", 1};
			};
            
		};

		class FullAuto: Mode_FullAuto {
            
			class BaseSoundModeType {
				//weaponSoundEffect = "DefaultRifle";
				//closure1 = {"A3\sounds_f\weapons\closure\closure_rifle_6", 1.412538, 1, 10};
				//closure2 = {"A3\sounds_f\weapons\closure\closure_rifle_7", 1.412538, 1, 10};
				//soundClosure = {"closure1", 0.500000, "closure2", 0.500000};
			};
            
			class StandardSound: BaseSoundModeType {
				begin1[] = {"\ASE_replacementSounds\sound\pew", 5, 1, 1200};
				soundBegin[] = {"begin1", 1};
			};

		};
        
        reloadMagazineSound[] = {"\ASE_replacementSounds\sound\pew", 5, 1, 10};
        
	};
    
};