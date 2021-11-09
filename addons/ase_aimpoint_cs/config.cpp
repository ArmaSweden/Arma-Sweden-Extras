#include "CfgPatches.hpp"

class asdg_OpticRail;    // External class reference
class asdg_OpticRail1913: asdg_OpticRail 
{
    class compatibleItems
    {
        ASE_optic_AimpointCS = 1;
    };
};

class cfgWeapons
{
	class ItemCore;
	class InventoryItem_Base_F;
	class InventoryOpticsItem_Base_F;
	class ASE_optic_AimpointCS: ItemCore
	{
		displayName="Aimpoint CS";
		author="SageNTitled of Arma Sweden";
		picture="\Arma-Sweden-Extras\addons\ase_aimpoint_cs\data\uipicture_ca.paa";
		model = "Arma-Sweden-Extras\addons\ase_aimpoint_cs\AimpointCS";
		scope = 2;
		descriptionShort = "Ett helt vanligt sikte.";
		weaponInfoType = "RscWeaponZeroing";

		class ItemInfo: InventoryOpticsItem_Base_F
		{
			mass = 8;
			opticType = 1;
			optics = true;
			modelOptics="A3\Weapons_F\empty";
			class OpticsModes
			{
				class ASE_optic_AimpointCS_Scope
				{
					opticsID = 1;
					useModelOptics = false;
					opticsPPEffects[]={"OpticsCHAbera5","OpticsBlur5"};
					opticsFlare = true;
					opticsDisablePeripherialVision = false;
					opticsZoomMin = 0.375;
					opticsZoomMax = 1.1;
					opticsZoomInit=0.75;
					memoryPointCamera = "opticView";
					visionMode[] = {};
					distanceZoomMin=300;
					distanceZoomMax=300;
				};
				class ASE_optic_AimpointCS_Collimator
				{
					opticsID = 2;
					useModelOptics = false;
					opticsPPEffects[]={""};
					opticsFlare = false;
					opticsDisablePeripherialVision = false;
					opticsZoomMin=0.375;
					opticsZoomMax=1;
					opticsZoomInit=0.75;
					memoryPointCamera = "eye";
					visionMode[] = {}; /// Can be combined with NVG
					distanceZoomMin=300;
					distanceZoomMax=300;
				};
			};
		};
		inertia = 0.1;
	};
};