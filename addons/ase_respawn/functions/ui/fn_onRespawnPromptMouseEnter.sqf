#include "..\..\defines.hpp"

params ["_control"];

_display = ctrlParent _control;
_background = _display displayCtrl 182611;

_background ctrlSetBackgroundColor A_COLOR_BACKGROUND_HOVER;