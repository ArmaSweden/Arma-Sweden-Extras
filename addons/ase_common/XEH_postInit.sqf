if (!hasInterface) exitWith {};

#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["ASE Common", "ViewDistanceUp", ["Increase view distance", "Increases view distance by 500 m"], {
    [ASE_setting_common_viewDistanceInterval] call ASE_fnc_adjustViewDistance;
}, {}, [DIK_F2, [false, false, false]], false, 0] call CBA_fnc_addKeybind;

["ASE Common", "ViewDistanceDown", ["Decrease view distance", "Decreases view distance by 500 m"], {
    [-ASE_setting_common_viewDistanceInterval] call ASE_fnc_adjustViewDistance;
}, {}, [DIK_F1, [false, false, false]], false, 0] call CBA_fnc_addKeybind;