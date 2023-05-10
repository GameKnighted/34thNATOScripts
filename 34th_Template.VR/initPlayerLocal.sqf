//Post-Init Setup of saved Loadout (Measure taken to help prevent Naked/unarmed People)


// Save Inventory on mission start
[player, [missionNamespace, "Waldo_Player_Inventory"], [], false] call BIS_fnc_saveInventory;

player addAction [
    "Flip Vehicle",
    "MissionScripts\Logistics\LogiHelpers\flipAction.sqf",
    [],
    0,
    false,
    true,
    "",
    "_this == (vehicle _target) && {(count nearestObjects [_target, ['landVehicle'], 5]) > 0 && {(vectorUp cursorTarget) select 2 < 0}}"
];

//Respawn Reapplication Of Loadout Segment
["CAManBase", "Respawn", {
    params ["_unit"];
    if (_unit == player) then {
        [_unit, [missionNamespace, "Waldo_Player_Inventory"]] call BIS_fnc_loadInventory;
        //_unit setUnitLoadout (missionNamespace getVariable "Waldo_Player_Inventory");
        // Respawn Text
        [] spawn Waldo_fnc_RespawnText;
        player addAction [
        "Flip Vehicle",
        "MissionScripts\Logistics\LogiHelpers\flipAction.sqf",
        [],
        0,
        false,
        true,
        "",
        "_this == (vehicle _target) && {(count nearestObjects [_target, ['landVehicle'], 5]) > 0 && {(vectorUp cursorTarget) select 2 < 0}}"
    ];
    };
}] call CBA_fnc_addClassEventHandler;

/*
=====================RESPAWN WITH LOADOUT ON DEATH====================================

UNCOMMENT THE BELOW IF YOU WANT PEOPLE TO RESPAWN WITH WHAT THEY DIED WITH!


*/

/*
["CAManBase", "Killed", {
    params ["_unit"];
    if (_unit == player) then {
        [_unit, [player, "Waldo_Player_Inventory"]] call BIS_fnc_saveInventory;
    };
}] call CBA_fnc_addClassEventHandler;


*/
