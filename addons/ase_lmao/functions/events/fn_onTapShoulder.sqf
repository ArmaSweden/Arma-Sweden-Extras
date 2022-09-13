// TODO: Make it work on AI too

params ["_target", "_shoulderNum"];

// Credit for ragdoll script: KillzoneKid

_target addEventHandler ["AnimStateChanged", {
    if (_this select 1 == "incapacitated") then {
        _target allowDamage false;
        _target setPosWorld getPosWorld _target;
        _target allowDamage true;
    };
}];

if (vehicle _target != _target) exitWith {};
private "_rag";
_rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
_rag setMass 1e10;
_rag attachTo [_target, [0,0,0], "Spine3"];
_rag setVelocity [0,0,6];
_target allowDamage false;
detach _rag;
0 = [_rag, _target] spawn {
	params ["_rag", "_target"];
	deleteVehicle _rag;
	_target allowDamage true;
};