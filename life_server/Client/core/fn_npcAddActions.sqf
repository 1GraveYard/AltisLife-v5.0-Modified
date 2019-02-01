#include "..\script_macros.hpp"
/*
	File: fn_npcAddActions.sqf
	Author: Maihym
	
	Description:
	Add all addactions to npcs.
*/
if(life_npcAddActionsStart)exitWith{};
life_npcAddActionsStart = true;

[] call life_fnc_setupStationService;

//Master group
master_group enableSimulation false;
master_group allowDamage false;
master_group hideObject true;

//Civ Car shops
_civCarShops = [carshop_athira,carshop_kavala,carshop_pyrgos,carshop_sofia];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","Car Shop"];
}forEach _civCarShops;

carshop_athira addAction["Car Shop",life_fnc_vehicleShopMenu,["civ_car",civilian,"civ_car_3","civ","Bruce's New & Used Auto's"],1.5,true,true,"","true",5];
carshop_kavala addAction["Car Shop",life_fnc_vehicleShopMenu,["civ_car",civilian,["civ_car_1","civ_car_1_1","civ_car_1_2"],"civ","Bruce's New & Used Auto's"],1.5,true,true,"","true",5];
carshop_pyrgos addAction["Car Shop",life_fnc_vehicleShopMenu,["civ_car",civilian,"civ_car_2","civ","Bruce's New & Used Auto's"],1.5,true,true,"","true",5];
carshop_sofia addAction["Car Shop",life_fnc_vehicleShopMenu,["civ_car",civilian,"civ_car_4","civ","Bruce's New & Used Auto's"],1.5,true,true,"","true",5];

//Civ car garages
_civCarGarages = [cargarage_athira,cargarage_kavala,cargarage_sofia];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","Car Garage"];
	_x addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
}forEach _civCarGarages;

cargarage_athira addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then {    
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; 
	} else { 
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";   
	createDialog "Life_impound_menu";   
	disableSerialization;   
	ctrlSetText[2802,"Fetching Vehicles...."];   
	life_garage_sp = "car_g_3";  }];
	
cargarage_kavala addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then {    
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; 
	} else { 
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";   
	createDialog "Life_impound_menu";   
	disableSerialization;   
	ctrlSetText[2802,"Fetching Vehicles...."];   
	life_garage_sp = "car_g_1";  }];
	
cargarage_sofia addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then {    
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; 
	} else { 
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";   
	createDialog "Life_impound_menu";   
	disableSerialization;   
	ctrlSetText[2802,"Fetching Vehicles...."];   
	life_garage_sp = "car_g_2";  }];

//Cop Car Shops and garages
_copCarShops = [copcarshop1,copcarshop2,copcarshop3,copcarshop4];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setObjectTexture [0,"textures\cop_uniform.jpg"];
	_x setVariable ["realname","Cop Car Shop"];
	_x addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
}forEach _copCarShops;
copcarshop1 addAction["Vehicle Shop",life_fnc_vehicleShopMenu,["cop_car",west,"cop_car_1","cop","APD - Kavala District"],1.5,true,true,"","true",5];
copcarshop1 addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then {    
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { 
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "cop_car_1"; life_garage_type = "Car"; },"",0,false,false,"",'playerSide isEqualTo west'];

copcarshop2 addAction["Vehicle Shop",life_fnc_vehicleShopMenu,["cop_car",west,"cop_car_2","cop","APD - Athira District"],1.5,true,true,"","true",5];
copcarshop2 addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then {    
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { 
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "cop_car_2"; life_garage_type = "Car"; },"",0,false,false,"",'playerSide isEqualTo west'];
	
copcarshop3 addAction["Vehicle Shop",life_fnc_vehicleShopMenu,["cop_car",west,"cop_car_3","cop","APD - Pygros District"],1.5,true,true,"","true",5];
copcarshop3 addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then {    
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { 
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "cop_car_3"; life_garage_type = "Car"; },"",0,false,false,"",'playerSide isEqualTo west'];
	
copcarshop4 addAction["Vehicle Shop",life_fnc_vehicleShopMenu,["cop_car",west,"cop_car_5","cop","APD - Highway Patrol"],1.5,true,true,"","true",5];
copcarshop4 addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then {    
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { 
	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "cop_car_5"; life_garage_type = "Car"; },"",0,false,false,"",'playerSide isEqualTo west'];

//DP Missions
_dpMarkers = [dp_1,dp_2,dp_3,dp_4,dp_5,dp_6,dp_7,dp_8,dp_9,dp_10,dp_11,dp_12,dp_13,dp_14,dp_15,dp_16,dp_17,dp_18,dp_19,dp_20,dp_21,dp_22,dp_23,dp_24,dp_25];
{
	_x allowDamage false;
	_x enableSimulation false;
	_x setVariable["realname","Delivery Missions"];
	_x addAction["Deliver Package",life_fnc_dpFinish,"dp_1",0,false,false,"",'!isNil "life_dp_point" && life_delivery_in_progress && life_dp_point == _target ',5];
	_x addAction["Get Delivery Mission",life_fnc_getDPMission,"dp_1",0,false,false,"",' isNil "life_dp_point" && !life_delivery_in_progress ',5];
}forEach _dpMarkers;
dp_missions allowDamage false;
dp_missions enableSimulation false;
dp_missions addAction["Get Delivery Mission",life_fnc_getDPMission,"dp_1",0,false,false,"",' isNil "life_dp_point" && !life_delivery_in_progress ',5];

//Atm
_atmMarkers = [atm_1,atm_2,atm_3,atm_4,atm_5,atm_6,atm_7,atm_8,atm_9,atm_10,atm_11,atm_12,atm_13,atm_14,atm_15,atm_16,atm_17,atm_18,atm_19,atm_20,atm_21,atm_22,atm_23,atm_24,atm_25];
{
	_x allowDamage false;
	_x enableSimulation false;
	_x addAction["<t color='#ADFF2F'>ATM</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' isNull objectParent player && player distance _target < 4 '];
}forEach _atmMarkers;


//Diving Shops
_divingShopNPCs = [divingshop_katalaki,divingshop_kavala];
{
	_x allowDamage false;
	removeallWeapons _x;
	_x enableSimulation false;
	_x setVariable["realname","Diving Shop"];
	_x addAction["Diving Shop",life_fnc_clothingMenu,"dive",1.5,true,true,"","true",5];
	_x addAction["Diving Weapon Shop",life_fnc_weaponShopMenu,"dive",1.5,true,true,"","true",5];
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "dive" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "dive" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"dive",0,false,false,"",' !license_civ_dive && playerSide isEqualTo civilian '];
}forEach _divingShopNPCs;


//Processing
_processingNPCs = [processcocaine1,processcopper1,processheroin1,processiron1,processoil1,processrock1,processsalt1,processsand1,processdiamond1,processmarijuana1];
{
	_x enableSimulation false;
	_x allowDamage false;
}forEach _processingNPCs;
//Cocaine
processcocaine1 setVariable["realname","Cocaine Processor"];
processcocaine1 addAction[localize"STR_Process_Cocaine",life_fnc_processAction,"cocaine",0,false,false,"",' life_inv_cocaineUnprocessed > 0 && !life_is_processing && !life_action_inUse'];
processcocaine1 addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "cocaine" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "cocaine" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"cocaine",0,false,false,"",' !license_civ_cocaine && playerSide isEqualTo civilian '];
//Copper
processcopper1 setVariable["realname","Copper Processor"];
processcopper1 addAction[localize"STR_Process_Copper",life_fnc_processAction,"copper",0,false,false,"",' life_inv_copperUnrefined > 0 && !life_is_processing && !life_action_inUse'];
processcopper1 addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "iron" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "iron" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"iron",0,false,false,"",' !license_civ_iron && playerSide isEqualTo civilian '];
//Diamond
processdiamond1 setVariable["realname","Diamond Processor"];
processdiamond1 addAction[localize"STR_Process_Diamond",life_fnc_processAction,"diamond",0,false,false,"",' life_inv_diamondUncut > 0 && !life_is_processing && !life_action_inUse'];
processdiamond1 addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "diamond" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "diamond" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"diamond",0,false,false,"",' !license_civ_diamond && playerSide isEqualTo civilian '];
//Heroin
processheroin1 setVariable["realname","Heroin Processor"];
processheroin1 addAction[localize"STR_Process_Heroin",life_fnc_processAction,"heroin",0,false,false,"",' life_inv_heroinUnprocessed > 0 && !life_is_processing && !life_action_inUse'];
processheroin1 addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "heroin" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "heroin" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"heroin",0,false,false,"",' !license_civ_heroin && playerSide isEqualTo civilian '];
//Iron
processiron1 setVariable["realname","Iron Processor"];
processiron1 addAction[localize"STR_Process_Iron",life_fnc_processAction,"iron",0,false,false,"",' life_inv_ironUnrefined > 0 && !life_is_processing && !life_action_inUse'];
processiron1 addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "iron" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "iron" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"iron",0,false,false,"",' !license_civ_iron && playerSide isEqualTo civilian '];
//Oil
processoil1 setVariable["realname","Oil Processor"];
processoil1 addAction[localize"STR_Process_Oil",life_fnc_processAction,"oil",0,false,false,"",' life_inv_oilUnprocessed > 0 && !life_is_processing && !life_action_inUse'];
processoil1 addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "oil" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "oil" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"oil",0,false,false,"",' !license_civ_oil && playerSide isEqualTo civilian '];
//Rock
processrock1 setVariable["realname","Rock Processor"];
processrock1 addAction[localize"STR_MAR_Process_Rock",life_fnc_processAction,"cement",0,false,false,"",' life_inv_rock > 0 && !life_is_processing && !life_action_inUse'];
processrock1 addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "cement" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "cement" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"cement",0,false,false,"",' !license_civ_cement && playerSide isEqualTo civilian '];
//Salt
processsalt1 setVariable["realname","Salt Processor"];
processsalt1 addAction[localize"STR_Process_Salt",life_fnc_processAction,"salt",0,false,false,"",' life_inv_saltUnrefined > 0 && !life_is_processing && !life_action_inUse'];
processsalt1 addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "salt" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "salt" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"salt",0,false,false,"",' !license_civ_salt && playerSide isEqualTo civilian '];
//Sand
processsand1 setVariable["realname","Sand Processor"];
processsand1 addAction[localize"STR_MAR_Process_Sand",life_fnc_processAction,"sand",0,false,false,"",' life_inv_sand > 0 && !life_is_processing && !life_action_inUse'];
processsand1 addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "sand" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "sand" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"sand",0,false,false,"",' !license_civ_sand && playerSide isEqualTo civilian '];
//Marijuana
processmarijuana1 setVariable["realname","Marijuana Processor"];
processmarijuana1 addAction[localize"STR_Process_Marijuana",life_fnc_processAction,"marijuana",0,false,false,"",' life_inv_cannabis > 0 && !life_is_processing && !life_action_inUse'];
processmarijuana1 addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "marijuana" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "marijuana" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"marijuana",0,false,false,"",' !license_civ_marijuana && playerSide isEqualTo civilian '];

//Trader Shops
_traders = [cement_trader,fishmarket1,goldbuyer1,diamondtrader1,glasstrader1,ironandcoppertrader1,oiltrader1,salttrader,turtledealer1,turtledealer2,turtledealer3,Dealer_1,Dealer_2,Dealer_3];
{
	_x allowDamage false;
	_x enableSimulation false;
	removeAllWeapons _x;
}forEach _traders;

cement_trader addAction["Cement Trader",life_fnc_virt_menu,"cement",1.5,true,true,"","true",5];
cement_trader setVariable ["realname","Cement Trader"];

diamondtrader1 addAction["Diamond Trader",life_fnc_virt_menu,"diamond",1.5,true,true,"","true",5];
diamondtrader1 setVariable ["realname","Diamond Trader"];

glasstrader1 addAction["Glass Trader",life_fnc_virt_menu,"glass",1.5,true,true,"","true",5];
glasstrader1 setVariable ["realname","Glass Trader"];

ironandcoppertrader1 addAction["Iron / Copper Trader",life_fnc_virt_menu,"iron",1.5,true,true,"","true",5];
ironandcoppertrader1 setVariable ["realname","Iron / Copper Trader"];

oiltrader1 addAction["Oil Trader",life_fnc_virt_menu,"oil",1.5,true,true,"","true",5];
oiltrader1 setVariable ["realname","Oil Trader"];

salttrader addAction["Salt Trader",life_fnc_virt_menu,"salt",1.5,true,true,"","true",5];
salttrader setVariable ["realname","Salt Trader"];

turtledealer1 addAction["Wong's Food Cart",life_fnc_virt_menu,"wongs",1.5,true,true,"","true",5];
turtledealer1 setVariable ["realname","Wong's Food Cart"];

turtledealer2 addAction["Wong's Food Cart",life_fnc_virt_menu,"wongs",1.5,true,true,"","true",5];
turtledealer2 setVariable ["realname","Wong's Food Cart"];

turtledealer3 addAction["Wong's Food Cart",life_fnc_virt_menu,"wongs",1.5,true,true,"","true",5];
turtledealer3 setVariable ["realname","Wong's Food Cart"];



//Drug Dealers
_drugdealers = [Dealer_1,Dealer_2,Dealer_3];
{
	_x addAction["Drug Dealer",life_fnc_virt_menu,"drugdealer",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian ',5];
	_x addAction["Question Dealer",life_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 5 && {(player getVariable "onDuty") == "cop"} && !life_action_inUse ',5];
	_x setVariable ["realname","Drug Dealer"];
}forEach _drugdealers;

goldbuyer1 addAction["Gold Buyer",life_fnc_virt_menu,"gold",1.5,true,true,"","true",5];
goldbuyer1 setVariable ["realname","Gold Buyer"];

//Markets
_markets = [kavala_market_1,market_zaros,pyrgos_market,sofia_market,athira_market];
{
	_x addAction["Market",life_fnc_virt_menu,"market",1.5,true,true,"","true",5];
	_x setVariable ["realname","Market"];
}forEach _markets;

fishmarket1 addAction["Fish Market",life_fnc_virt_menu,"fishmarket",1.5,true,true,"","true",5];
fishmarket1 setVariable ["realname","Fish Market"];

//DMV
_dmvs = [athira_dmv,kavala_dmv,pyrgos_dmv,sofia_dmv];
{
	_x allowDamage false;
	_x enableSimulation false;
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "driver" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "driver" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"driver",0,false,false,"",' !license_civ_driver && playerSide isEqualTo civilian '];
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "boat" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "boat" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"boat",0,false,false,"",' !license_civ_boat && playerSide isEqualTo civilian ']; 
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "pilot" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "pilot" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"pilot",0,false,false,"",' !license_civ_pilot && playerSide isEqualTo civilian ']; 
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "trucking" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "trucking" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"trucking",0,false,false,"",' !license_civ_trucking && playerSide isEqualTo civilian '];
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "home" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "home" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"home",0,false,false,"",' !license_civ_home && playerSide isEqualTo civilian '];
	_x setVariable["realname","Altis Life DMV"];
}forEach _dmvs;

//Air Garage
_airgarages = [airgarage_airport,copairshop1,copairshop2];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setObjectTexture [0,"textures\cop_uniform.jpg"];
	_x setVariable["realname","Air Garage"];
	_x addAction["Store vehicle in Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store',5];
}forEach _airgarages;
airgarage_airport addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then { 
	[getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { 
	[getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air"; 
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "air_g_1"; }];

copairshop1 addAction["Helicopter Shop",life_fnc_vehicleShopMenu,["cop_air",west,"cop_air_1","cop","APD - Kavala District"],1.5,true,true,"","true",5];
copairshop1 addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then { 
	[getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { 
	[getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air"; 
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "cop_air_1"; }];

copairshop2 addAction["Helicopter Shop",life_fnc_vehicleShopMenu,["cop_airhq",west,"cop_air_2","cop","APD - Air HQ"],1.5,true,true,"","true",5];
copairshop2 addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then { 
	[getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { 
	[getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air"; 
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "cop_air_2"; }];

//Chop Shops
_chopshops = [chopshop1,chopshop2,chopshop3,chopshop4];
{
	_x allowDamage false;
	_x enableSimulation false;
	_x setVariable ["realname","Chop Shop"];
}forEach _chopshops;
chopshop1 addAction["Chop Shop",life_fnc_chopShopMenu,"chop_shop_1",1.5,true,true,"","true",5];
chopshop2 addAction["Chop Shop",life_fnc_chopShopMenu,"chop_shop_2",1.5,true,true,"","true",5];
chopshop3 addAction["Chop Shop",life_fnc_chopShopMenu,"chop_shop_3",1.5,true,true,"","true",5];
chopshop4 addAction["Chop Shop",life_fnc_chopShopMenu,"chop_shop_4",1.5,true,true,"","true",5];

//Clothing stores
_clothingstores = [clothingstore_athira,clothingstore_kavala,clothingstore_sofia,clothingstore_zaros];
{
	_x allowDamage false;
	_x enableSimulation false;
	_x setVariable ["realname","Clothing Store"];
	_x addAction["Clothing Store",life_fnc_clothingMenu,"bruce",1.5,true,true,"","true",5];
}forEach _clothingstores;

//Kart shops
kartshop1 enableSimulation false;
kartshop1 allowDamage false;
kartshop1 setVariable ["realname","Kart Shop"];
kartshop1 addAction["Go-kart  Shop",life_fnc_vehicleShopMenu,["kart_shop",civilian,"kart_shop_1","civ","Bobby's Kart Shack"],1.5,true,true,"","true",5];
kartshop1 addAction["Clothing Store",life_fnc_clothingMenu,"kart",1.5,true,true,"","true",5];

//Hospital shops
_hospitalshops = [hospital_kavala];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","Nurse"];
	_x addAction["Medical Assistance",life_fnc_healHospital,"",1.5,true,true,"","true",5];
}forEach _hospitalshops;

//General stores
_generalstore = [athira_generalstore,kavala_generalstore,pyrgos_generalstore,sofia_generalstore];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","General Store"];
	_x addAction["General Store",life_fnc_weaponShopMenu,"genstore",1.5,true,true,"","true",5];
}forEach _generalstore;

//Truck shops
_truckshops = [truckshop1,truckshop2];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","Truck Shop"];
}forEach _truckshops;
truckshop1 addAction["Truck Shop",life_fnc_vehicleShopMenu,["civ_truck",civilian,["civ_truck_2","civ_truck_2_1"],"civ","Bruce's New & Used Trucks"],1.5,true,true,"","true",5];
truckshop2 addAction["Truck Shop",life_fnc_vehicleShopMenu,["civ_truck",civilian,"civ_truck_1","civ","Bruce's New & Used Trucks"],1.5,true,true,"","true",5];

//Bailiff
removeAllWeapons bailiff_1;
bailiff_1 enableSimulation false;
bailiff_1 allowDamage false;
bailiff_1 setVariable ["realname","Bailiff"];
bailiff_1 addAction["Pay Bail",life_fnc_postBail,"",0,false,false,"",' isNil "life_canpay_bail" && life_is_arrested ',5];
bailiff_1 setObjectTexture [0,"textures\cop_uniform.jpg"];

//Boat shops
_boatshops = [copboatshop1,boatshop1,boatshop2];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","Boat Shop"];
	_x addAction["Store vehicle in Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store',5];
}forEach _boatshops;

	copboatshop1 addAction["Boat Shop",life_fnc_vehicleShopMenu,["cop_ship",west,"cop_ship_1","cop","APD - Kavala District - Boat Store"],1.5,true,true,"","true",5];
	copboatshop1 setObjectTexture [0,"textures\cop_uniform.jpg"];
	copboatshop1 addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then {    
	[getPlayerUID player,playerSide,"Ship",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { 
	[getPlayerUID player,playerSide,"Ship",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "cop_ship_1"; life_garage_type = "Ship"; },"",0,false,false,"",'playerSide isEqualTo west'];
	
	boatshop1 addAction["Boat Shop",life_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_1","civ","Billy's Boat Rentals & Ownership"],1.5,true,true,"","true",5];
	boatshop1 addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then {    
	[getPlayerUID player,playerSide,"Ship",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { 
	[getPlayerUID player,playerSide,"Ship",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "civ_ship_1"; life_garage_type = "Ship"; },"",0,false,false,"",'playerSide isEqualTo civilian'];
	
	boatshop2 addAction["Boat Shop",life_fnc_vehicleShopMenu,["civ_ship",civilian,"civ_ship_2","civ","Billy's Boat Rentals & Ownership"],1.5,true,true,"","true",5];
	boatshop2 addAction[localize"STR_Garage_Title",  {   if (life_HC_isActive) then {    
	[getPlayerUID player,playerSide,"Ship",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { 
	[getPlayerUID player,playerSide,"Ship",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "civ_ship_2"; life_garage_type = "Ship"; },"",0,false,false,"",'playerSide isEqualTo civilian'];

//Gun Shops
_gunshops = [gunshop1,gunshop2];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","Gun Store"];
	_x addAction["Gun Store",life_fnc_weaponShopMenu,"gun",0,false,false,"",' license_gun && playerSide == civilian',5];
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "gun" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "gun" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"gun",0,false,false,"",' !license_civ_gun && playerSide isEqualTo civilian '];
}forEach _gunshops;

//Cop Shops
_copshops = [h1_3,h1_3_1,h1_3_2,h1_3_3];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","Cop Shop"];
	_x addAction["Cop Item Shop",life_fnc_virt_menu,"cop",1.5,true,true,"","true",5];  
	_x addAction["Cop Clothing Shop",life_fnc_clothingMenu,"cop",1.5,true,true,"","true",5];  
	_x addAction["Cop Basic Weapon Shop",life_fnc_weaponShopMenu,"cop_basic",1.5,true,true,"","true",5];
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "cg" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "cg" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"cg",0,false,false,"",' !license_cop_cg && playerSide isEqualTo west '];
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "cAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "cAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"cAir",0,false,false,"",' !license_cop_cg && playerSide isEqualTo west '];
	_x setObjectTextureGlobal [0,"textures\cop_uniform.jpg"];
}forEach _copshops;

//Medic Shop
_medicshops = [medicshop1,medicshop2,medicshop3];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","EMS Shop"];
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "mAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "mAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"mAir",0,false,false,"",' !license_med_mAir && playerSide isEqualTo independent '];
	_x addAction["EMS Clothing Shop",life_fnc_clothingMenu,"med",1.5,true,true,"","true",5];
	_x addAction["EMS Weapon Shop",life_fnc_weaponShopMenu,"med_basic",1.5,true,true,"","true",5];
	_x addAction["EMS Item Shop",life_fnc_virt_menu,"med",1.5,true,true,"","true",5];
	_x addAction["Store vehicle in Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store',5];
	_x setObjectTexture [0,"textures\medic_uniform.jpg"];
}forEach _medicshops;

medicshop1 addAction["Vehicle Shop",life_fnc_vehicleShopMenu,["med_shop",independent,"med_car_3","med","Kavala Hosptial"],1.5,true,true,"","true",5];
medicshop1 addAction["Helicopter Shop",life_fnc_vehicleShopMenu,["med_air_hs",independent,"medic_spawn_2","med","Kavala Hosptial"],1.5,true,true,"","true",5];
medicshop1 addAction[localize"STR_MAR_W_Car_Garage",  {   if (life_HC_isActive) then {    [
	getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [
	getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "med_car_3"; life_garage_type = "Car"; },"",0,false,false,"",'playerSide isEqualTo independent'];

medicshop1 addAction[localize"STR_MAR_Helicopter_Garage",  {   if (life_HC_isActive) then {    [
	getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [
	getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "medic_spawn_2"; life_garage_type = "Air"; },"",0,false,false,"",'playerSide isEqualTo independent '];

medicshop2 addAction["Vehicle Shop",life_fnc_vehicleShopMenu,["med_shop",independent,"med_car_2","med","Kavala Hosptial"],1.5,true,true,"","true",5];
medicshop2 addAction["Helicopter Shop",life_fnc_vehicleShopMenu,["med_air_hs",independent,"medic_spawn_3","med","Kavala Hosptial"],1.5,true,true,"","true",5];
medicshop2 addAction[localize"STR_MAR_W_Car_Garage",  {   if (life_HC_isActive) then {    [
	getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [
	getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "med_car_2"; life_garage_type = "Car"; },"",0,false,false,"",'playerSide isEqualTo independent'];

medicshop2 addAction[localize"STR_MAR_Helicopter_Garage",  {   if (life_HC_isActive) then {    [
	getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [
	getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "medic_spawn_3"; life_garage_type = "Air"; },"",0,false,false,"",'playerSide isEqualTo independent '];

medicshop3 addAction["Vehicle Shop",life_fnc_vehicleShopMenu,["med_shop",independent,"med_car_1","med","Kavala Hosptial"],1.5,true,true,"","true",5];
medicshop3 addAction["Helicopter Shop",life_fnc_vehicleShopMenu,["med_air_hs",independent,"medic_spawn_1","med","Kavala Hosptial"],1.5,true,true,"","true",5];
medicshop3 addAction[localize"STR_MAR_W_Car_Garage",  {   if (life_HC_isActive) then {    [
	getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [
	getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "med_car_1"; life_garage_type = "Car"; },"",0,false,false,"",'playerSide isEqualTo independent'];

medicshop3 addAction[localize"STR_MAR_Helicopter_Garage",  {   if (life_HC_isActive) then {    [
	getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [
	getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};  
	createDialog "Life_impound_menu";  
	disableSerialization;  
	ctrlSetText[2802,"Fetching Vehicles...."];  
	life_garage_sp = "medic_spawn_1"; life_garage_type = "Air"; },"",0,false,false,"",'playerSide isEqualTo independent '];

//Rebel shops
_rebelshops = [reb_1,reb_1_1,reb_1_2];
{
	removeallWeapons _x;
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","Rebel Shop"];
	_x addAction["Rebel Market",life_fnc_virt_menu,"rebel",1.5,true,true,"","true",5];
	_x addAction[localize "STR_MAR_Rebel_Clothing_Shop",life_fnc_clothingMenu,"reb",0,false,false,"",' license_civ_rebel && playerSide isEqualTo civilian'];
	_x addAction[localize "STR_MAR_Rebel_Weapon_Shop",life_fnc_weaponShopMenu,"rebel",0,false,false,"",' license_civ_rebel && playerSide isEqualTo civilian'];
	_x addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "rebel" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "rebel" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"rebel",0,false,false,"",' !license_civ_rebel && playerSide isEqualTo civilian '];
	_x addAction["<t color='#ADFF2F'>ATM</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 ',5];
}forEach _rebelshops;

//Rebel car shops
_rebelcarshops = [reb_1_3,reb_1_3_1];
{
	removeallWeapons _x;
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","Rebel Vehicle Shop"];
	_x addAction["Store vehicle in Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store',5];
}forEach _rebelcarshops;
reb_1_3 addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["reb_car",civilian,["reb_v_1","reb_v_1_1"],"reb","Rebel Motorpool - Western Side"],0,false,false,"",'license_civ_rebel'];


reb_1_3_1 addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["reb_car",civilian,"reb_v_2","reb","Rebel Motorpool - Western Side"],0,false,false,"",'license_civ_rebel'];

//Civ Air shops
_civairshops = [airshop1,airshop2];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable ["realname","Civillian Air Shop"];
}forEach _civairshops;
airshop1 addAction["Helicopter Shop",life_fnc_vehicleShopMenu,["civ_air",civilian,["civ_air_1","civ_air_1_2"],"civ","Carl's Airial Auto's"],1.5,true,true,"","true",5];
airshop2 addAction["Helicopter Shop",life_fnc_vehicleShopMenu,["civ_air",civilian,["civ_air_2","civ_air_2_1"],"civ","Carl's Airial Auto's"],1.5,true,true,"","true",5];

//Repair Air shops
repairair1 enableSimulation false;
repairair1 allowDamage false;
repairair1 setVariable ["realname","Air Repair Shop"];
repairair1 addAction["Service Helicopter",life_fnc_serviceChopper,"",1.5,true,true,"","true",5];

//Capture Gang Hideout
_hideouts = [gang_flag_1,gang_flag_2,gang_flag_3];
{
	_x allowDamage false;
	_x enableSimulation false;
	_x addAction ["Capture Gang Area",life_fnc_captureHideout,"",0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"}',5];
}forEach _hideouts;

//Fed Vault
fed_bank addAction["Open Vault",life_fnc_safeOpen,"",0,false,false,"",' playerSide == civilian && (_target getVariable["safe_open",false]) ',5];
fed_bank addAction["Fix Vault",life_fnc_safeFix,"",0,false,false,"",' ((player getVariable "onDuty") == "cop") && (_target getVariable ["safe_open",false]) ',5];

//Gang Market
_gangmarket = [gangmarket2,gangmarket3,gangmarket1];
{
	_x enableSimulation false;
	_x allowDamage false;
	_x setVariable["realname","Gang Market"];
	_x addAction["Gang Market",life_fnc_virt_menu,"gang",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)} ',5];
}forEach _gangmarket;

//Gang Weapon Shop
_gangweapon = [gangweapon2,gangweapon1,gangweapon3];
{
	_x allowDamage false;
	_x enableSimulation false;
	_x setVariable["realname","Gang Armament"];
	_x addAction["Gang Clothing Store",life_fnc_clothingMenu,"gang",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)} && playerSide == civilian ',5];
	_x addAction["Armament",life_fnc_weaponShopMenu,"gang",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)} && playerSide == civilian ',5];
}forEach _gangweapon;

//Gang Processing
_gangprocessors = [coke_processor,mari_processor,heroin_processor];
{
	_x allowDamage false;
	_x enableSimulation false;
}forEach _gangprocessors;
coke_processor addAction["Process Cocaine",life_fnc_processAction,"cocaine",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; life_inv_cocaine_unprocessed > 0 && !life_is_processing && !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)} && playerSide == civilian ',5];
coke_processor setVariable["realname","Cocaine Processing"];
mari_processor addAction["Process Marijuana",life_fnc_processAction,"marijuana",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; life_inv_cannabis > 0 && !life_is_processing && !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)} && playerSide == civilian ',5];
mari_processor setVariable["realname","Marijuana Processing"];
heroin_processor addAction["Process Heroin",life_fnc_processAction,"heroin",0,false,false,"",' _b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; life_inv_heroinUnprocessed > 0 && !life_is_processing && !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)} && playerSide == civilian ',5];
heroin_processor setVariable["realname","Heroin Processing"];

//Gas Stations
_gasstations = [GS1,GS2,GS3,GS4,GS5,GS6,GS7,GS8,GS9,GS10,GS11,GS12,GS13,GS14,GS15,GS16,GS17,GS18];
{
	_x allowDamage false;
	_x enableSimulation false;
	_x setVariable["realname","Gas Station Clerk"];
	_x addAction["Gas Station Market",life_fnc_virt_menu,"f_station_coffee",0,false,false,"",'',5];
	_x addAction["Gas Station General Store",life_fnc_weaponShopMenu,"f_station_store",0,false,false,"",'',5];
}forEach _gasstations;