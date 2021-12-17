class CfgPatches
{
	class ASE_food
    {
		author = "SageNTitled of Arma Sweden";
		name = "ASE Food";
		url = "https://www.armasweden.se/";
		requiredAddons[] = {"ace_common", "ace_main"};
		requiredVersion = 0.100000;
		units[] = {};
		weapons[] = {};
	};
};

class CfgWeapons
{
	class ACE_ItemCore;
	class CBA_MiscItem_ItemInfo;

	class ASE_TrokaderoBottle : ACE_ItemCore
	{
		author = "SageNTitled of Arma Sweden";
        scope = 2;
        displayName = "Trokadero bottle";
        descriptionShort = "A bottle of Trokadero. Consume by 11.05.2022.";
        model = "Arma-Sweden-Extras\addons\ase_food\data\trokadero_bottle.p3d";
        // TODO: Add picture
		class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
		acex_field_rations_consumeTime = 10;
        acex_field_rations_thirstQuenched = 10;
        acex_field_rations_consumeText = "Drinking Trokadero...";
        acex_field_rations_replacementItem = "ASE_TrokaderoBottle_TwoThirds";
        acex_field_rations_consumeAnims[] = {
            "acex_field_rations_drinkStand",
            "acex_field_rations_drinkCrouch",
            "acex_field_rations_drinkProne"
        };
        acex_field_rations_consumeSounds[] = {
            "acex_field_rations_drink1",
            "acex_field_rations_drink1",
            "acex_field_rations_drink2"
        };
	};
    class ASE_TrokaderoBottle_TwoThirds : ASE_TrokaderoBottle
	{
		displayName = "Trokadero bottle (2/3)";
        descriptionShort = "A bottle of Trokadero. Consume within three days.";
		// TODO: Add model/texture
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
        acex_field_rations_replacementItem = "ASE_TrokaderoBottle_OneThird";
	};
	class ASE_TrokaderoBottle_OneThird : ASE_TrokaderoBottle
	{
		displayName = "Trokadero bottle (1/3)";
        descriptionShort = "A bottle of Trokadero. Consume within three days.";
		// TODO: Add model/texture
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        acex_field_rations_replacementItem = "ASE_TrokaderoBottle_Empty";
	};
    // TODO: Make undrinkable
	class ASE_TrokaderoBottle_Empty : ASE_TrokaderoBottle
	{
		displayName = "Trokadero bottle (empty)";
        descriptionShort = "An empty bottle of Trokadero.";
		// TODO: Add model/texture of empty bottle
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
        acex_field_rations_consumeTime = -1;
        acex_field_rations_thirstQuenched = -1;
        acex_field_rations_consumeText = "";
        acex_field_rations_replacementItem = "";
        acex_field_rations_consumeAnims[] = {};
        acex_field_rations_consumeSounds[] = {};
	};
};

class CfgVehicles
{
	class Item_Base_F;
	
	class ASE_TrokaderoBottle_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 2;
        scopeCurator = 2;
        displayName = "Trokadero bottle";
        vehicleClass = "Items";
        class TransportItems {
            class _xx_ASE_TrokaderoBottle {
                name = "ASE_TrokaderoBottle";
                count = 1;
            };
        };
	};
	class ASE_TrokaderoBottle_TwoThirds_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 2;
        scopeCurator = 2;
        displayName = "Trokadero bottle (2/3)";
        vehicleClass = "Items";
        class TransportItems {
            class _xx_ASE_TrokaderoBottle {
                name = "ASE_TrokaderoBottle_Half";
                count = 1;
            };
        };
	};
    class ASE_TrokaderoBottle_OneThird_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 2;
        scopeCurator = 2;
        displayName = "Trokadero bottle (1/3)";
        vehicleClass = "Items";
        class TransportItems {
            class _xx_ASE_TrokaderoBottle {
                name = "ASE_TrokaderoBottle_Half";
                count = 1;
            };
        };
	};
	class ASE_TrokaderoBottle_Empty_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 2;
        scopeCurator = 2;
        displayName = "Trokadero bottle (empty)";
        vehicleClass = "Items";
        class TransportItems {
            class _xx_ASE_TrokaderoBottle {
                name = "ASE_TrokaderoBottle_Empty";
                count = 1;
            };
        };
	};
};