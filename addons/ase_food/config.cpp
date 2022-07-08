class CfgPatches
{
	class ASE_food
    {
		author = "SageNTitled of Arma Sweden";
		name = "ASE Food";
		url = "https://www.armasweden.se/";
		requiredAddons[] = {"ace_common", "ace_main"};
		requiredVersion = 0.1;
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
        displayName = "Bottle (Trokadero)";
        descriptionShort = "A bottle of Trokadero. Consume by 11.05.2022.";
        model = "Arma-Sweden-Extras\addons\ase_food\data\TrokaderoBottle\trokadero_bottle.p3d";
        picture = "\Arma-Sweden-Extras\addons\ase_food\ui\picture_trokadero.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
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
		displayName = "Bottle (Trokadero) (2/3)";
        descriptionShort = "A bottle of Trokadero. Consume within three days.";
		// TODO: Add model/texture
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 7;
        };
        acex_field_rations_replacementItem = "ASE_TrokaderoBottle_OneThird";
	};
	class ASE_TrokaderoBottle_OneThird : ASE_TrokaderoBottle
	{
		displayName = "Bottle (Trokadero) (1/3)";
        descriptionShort = "A bottle of Trokadero. Consume within three days.";
		// TODO: Add model/texture
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 6;
        };
        acex_field_rations_replacementItem = "ASE_TrokaderoBottle_Empty";
	};
	class ASE_TrokaderoBottle_Empty : ASE_TrokaderoBottle
	{
		displayName = "Bottle (Trokadero) (empty)";
        descriptionShort = "An empty bottle of Trokadero.";
		// TODO: Add model/texture of empty bottle
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
        acex_field_rations_consumeTime = -1;
        acex_field_rations_thirstQuenched = -1;
        acex_field_rations_consumeText = "";
        acex_field_rations_replacementItem = "";
        acex_field_rations_consumeAnims[] = {};
        acex_field_rations_consumeSounds[] = {};
	};

    class ASE_TrokaderoCan : ACE_ItemCore
	{
		author = "SageNTitled of Arma Sweden";
        scope = 2;
        displayName = "Can (Trokadero)";
        descriptionShort = "A can of Trokadero. Consume by 11.05.2022.";
        model = "Arma-Sweden-Extras\addons\ase_food\data\TrokaderoCan\trokadero_can.p3d";
        picture = "\Arma-Sweden-Extras\addons\ase_food\ui\picture_trokadero_can.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
		acex_field_rations_consumeTime = 10;
        acex_field_rations_thirstQuenched = 5;
        acex_field_rations_consumeText = "Drinking Trokadero...";
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

    class ASE_PrincessCake : ACE_ItemCore
	{
		author = "SageNTitled of Arma Sweden";
        scope = 2;
        displayName = "Princess cake";
        descriptionShort = "A traditional Swedish pastry.";
        model = "Arma-Sweden-Extras\addons\ase_food\data\PrincessCake\princess_cake.p3d";
        picture = "\Arma-Sweden-Extras\addons\ase_food\ui\picture_princess_cake.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 12;
        };
		acex_field_rations_consumeTime = 10;
        acex_field_rations_hungerSatiated = 15;
        acex_field_rations_consumeText = "Eating princess cake...";
        acex_field_rations_replacementItem = "ASE_PrincessCake_ThreeQuarters";
	};
    class ASE_PrincessCake_ThreeQuarters : ASE_PrincessCake
	{
		displayName = "Princess cake (3/4)";
        descriptionShort = "A traditional Swedish pastry.";
		// TODO: Add model/texture
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
        acex_field_rations_replacementItem = "ASE_PrincessCake_TwoQuarters";
	};
    class ASE_PrincessCake_TwoQuarters : ASE_PrincessCake
	{
		displayName = "Princess cake (2/4)";
        descriptionShort = "A traditional Swedish pastry.";
		// TODO: Add model/texture
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
        acex_field_rations_replacementItem = "ASE_PrincessCake_OneQuarter";
	};
    class ASE_PrincessCake_OneQuarters : ASE_PrincessCake
	{
		displayName = "Princess cake (1/4)";
        descriptionShort = "A traditional Swedish pastry.";
		// TODO: Add model/texture
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 6;
        };
        acex_field_rations_replacementItem = "ASE_PrincessCake_Empty";
	};
    class ASE_PrincessCake_Empty : ASE_PrincessCake
	{
		displayName = "Princess cake (empty)";
        descriptionShort = "An empty plate.";
		// TODO: Add model/texture of empty plate
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        acex_field_rations_consumeTime = -1;
        acex_field_rations_hungerSatiated = -1;
        acex_field_rations_consumeText = "";
        acex_field_rations_replacementItem = "";
	};
};

class CfgVehicles
{
	class Item_Base_F;
	
    // TODO: Add as regular "thing" object for decoration
	class ASE_TrokaderoBottle_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 2;
        scopeCurator = 2;
        displayName = "Bottle (Trokadero)";
        vehicleClass = "Items";
        // TODO: Add editor preview picture
        class TransportItems {
            class _xx_ASE_TrokaderoBottle {
                name = "ASE_TrokaderoBottle";
                count = 1;
            };
        };
	};
	class ASE_TrokaderoBottle_TwoThirds_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 1;
        scopeCurator = 1;
        displayName = "Bottle (Trokadero) (2/3)";
        vehicleClass = "Items";
        class TransportItems {
            class _xx_ASE_TrokaderoBottle {
                name = "ASE_TrokaderoBottle_TwoThirds";
                count = 1;
            };
        };
	};
    class ASE_TrokaderoBottle_OneThird_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 1;
        scopeCurator = 1;
        displayName = "Bottle (Trokadero) (1/3)";
        vehicleClass = "Items";
        class TransportItems {
            class _xx_ASE_TrokaderoBottle {
                name = "ASE_TrokaderoBottle_OneThird";
                count = 1;
            };
        };
	};
	class ASE_TrokaderoBottle_Empty_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 1;
        scopeCurator = 1;
        displayName = "Bottle (Trokadero) (empty)";
        vehicleClass = "Items";
        class TransportItems {
            class _xx_ASE_TrokaderoBottle {
                name = "ASE_TrokaderoBottle_Empty";
                count = 1;
            };
        };
	};

    // TODO: Add as regular "thing" object for decoration
	class ASE_TrokaderoCan_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 2;
        scopeCurator = 2;
        displayName = "Can (Trokadero)";
        vehicleClass = "Items";
        // TODO: Add editor preview picture
        class TransportItems {
            class _xx_ASE_TrokaderoBottle {
                name = "ASE_TrokaderoCan";
                count = 1;
            };
        };
	};

    // TODO: Add as regular "thing" object for decoration
    class ASE_PrincessCake_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 2;
        scopeCurator = 2;
        displayName = "Princess cake";
        vehicleClass = "Items";
        // TODO: Add editor preview picture
        class TransportItems {
            class _xx_ASE_PrincessCake {
                name = "ASE_PrincessCake";
                count = 1;
            };
        };
	};
    class ASE_PrincessCake_ThreeQuarters_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 1;
        scopeCurator = 1;
        displayName = "Princess cake (3/4)";
        vehicleClass = "Items";
        // TODO: Add editor preview picture
        class TransportItems {
            class _xx_ASE_PrincessCake {
                name = "ASE_PrincessCake";
                count = 1;
            };
        };
	};
    class ASE_PrincessCake_TwoQuarters_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 1;
        scopeCurator = 1;
        displayName = "Princess cake (2/4)";
        vehicleClass = "Items";
        // TODO: Add editor preview picture
        class TransportItems {
            class _xx_ASE_PrincessCake {
                name = "ASE_PrincessCake";
                count = 1;
            };
        };
	};
    class ASE_PrincessCake_OneQuarter_Item : Item_Base_F {
		author = "SageNTitled of Arma Sweden";
        scope = 1;
        scopeCurator = 1;
        displayName = "Princess cake (1/4)";
        vehicleClass = "Items";
        // TODO: Add editor preview picture
        class TransportItems {
            class _xx_ASE_PrincessCake {
                name = "ASE_PrincessCake";
                count = 1;
            };
        };
	};
};