#include "script_macros.hpp"

waitUntil {!(isNil "allFunctionsReady")};
//diag_log format ["%1",allFunctionsReady];
[clientOwner] remoteExec ["TON_fnc_receiveFunctions",2];
waitUntil {(!(isNil "life_serverFunctionsReady"))}; waitUntil {life_serverFunctionsReady};
//diag_log format ["%1",life_serverFunctionsReady];

/*
    File: initPlayerLocal.sqf
    Author:

    Description:
    Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
    [] call compile preprocessFileLineNumbers "\life_hc\initHC.sqf";
}; //This is a headless client.

#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)

CONST(BIS_fnc_endMission,BIS_fnc_endMission);
if (LIFE_SETTINGS(getNumber,"spyGlass_toggle") isEqualTo 1) then {[] execVM "SpyGlass\fn_initSpy.sqf";};

[] call life_fnc_init;
[] execVM "briefing.sqf";