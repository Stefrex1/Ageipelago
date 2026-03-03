include "structs.xs";

// Town Centers are a special case: the foundation must be disabled; here we
// keep the id for the town center itself.
const int townCenterId = 109;

//Tech
const int university = 209;
const int blacksmith = 103;
const int monastery = 104;

//Military
const int barracks = 12;
const int archeryRange = 87;
const int stable = 101;
const int siegeWorkshop = 49;
const int castle = 82; // Also disable with defense

//Defense
const int palisadeGate = 792;
const int gate = 487;
const int palisadeWall = 72;
const int wall = 117;
const int watchTower = 79;
const int bombardTower = 236;

//Unique Economy
const int folwark = 1734;
const int muleCart = 1808;
const int pasture = 1889;
const int harbor = 1189;    //Also disable with military
const int caravanserai = 1754;
const int feitoria = 1021;

//Unique Military
const int fortifiedChurch = 1806; // Also disable with defense
const int krepost = 1251; // Also disable with defense
const int donjon = 1665; // Also disable with defense

vector buildsanity = cInvalidVector;

void InitBuildsanityStructs() {
    initializeStructsScript();
    defineStruct("Building");
    defineStructAttribute("Building", "name", TYPE_STRING);
    defineStructAttribute("Building", "id", TYPE_INT);
    defineStructAttribute("Building", "playerCount", TYPE_INT);
    defineStructAttribute("Building", "resourceCost", TYPE_FLOAT);

    defineStruct("Buildsanity");
    defineStructAttribute("Buildsanity", "buildings", TYPE_STRUCT_ARRAY);
    defineStructAttribute("Buildsanity", "currentBuildingTotalCost", TYPE_FLOAT);

    buildsanity = new("Buildsanity");
    int buildings = xsArrayCreateVector(0, cInvalidVector, "p1-buildings");
    structSetInt(buildsanity, "buildings", buildings);
}

void InitBuildsanityAlways() {
    int alwaysBuildingsCount = 2;
    int buildings = structGetInt(buildsanity, "buildings");
    int buildingsCount = xsArrayGetSize(buildings);
    xsArrayResizeVector(buildings, buildingsCount + alwaysBuildingsCount);

    xsChatData("Buildings Array Pointer Always: %d", buildings);

    vector wonder = new("Building");
    structSetString(wonder, "name", "Wonder");
    structSetInt(wonder, "id", 276);
    structSetInt(wonder, "playerCount", xsGetObjectCount(1, structGetInt(wonder, "id")));
    structSetFloat(wonder, "resourceCost", 175.0);
    xsArraySetVector(buildings, buildingsCount, wonder);
    buildingsCount++;

    vector outpost = new("Building");
    structSetString(outpost, "name", "Outpost");
    structSetInt(outpost, "id", 598);
    structSetInt(outpost, "playerCount", xsGetObjectCount(1, structGetInt(outpost, "id")));
    structSetFloat(outpost, "resourceCost", 30.0);
    xsArraySetVector(buildings, buildingsCount, outpost);

    xsEffectAmount(cSetAttribute, structGetInt(wonder, "id"), cDisabledFlag, 1.0, 1);
    xsEffectAmount(cSetAttribute, structGetInt(outpost, "id"), cDisabledFlag, 1.0, 1);
}

// TC Foundation disabled + Extra Town Centers
void InitBuildsanityEconomy() {
    int econBuildingsCount = 9;
    int buildings = structGetInt(buildsanity, "buildings");
    int buildingsCount = xsArrayGetSize(buildings);
    xsArrayResizeVector(buildings, buildingsCount + econBuildingsCount);
    
    xsChatData("Buildings Array Pointer Economy: %d", buildings);

    vector townCenter = new("Building");
    structSetString(townCenter, "name", "Town Center");
    structSetInt(townCenter, "id", 621);
    structSetInt(townCenter, "playerCount", xsGetObjectCount(1, townCenterId));
    structSetFloat(townCenter, "resourceCost", 375.0);
    xsArraySetVector(buildings, buildingsCount, townCenter);
    buildingsCount++;

    vector house = new("Building");
    structSetString(house, "name", "House");
    structSetInt(house, "id", 70);
    structSetInt(house, "playerCount", xsGetObjectCount(1, structGetInt(house, "id")));
    structSetFloat(house, "resourceCost", 25.0);
    xsArraySetVector(buildings, buildingsCount, house);
    buildingsCount++;

    vector mill = new("Building");
    structSetString(mill, "name", "Mill");
    structSetInt(mill, "id", 68);
    structSetInt(mill, "playerCount", xsGetObjectCount(1, structGetInt(mill, "id")));
    structSetFloat(mill, "resourceCost", 100.0);
    xsArraySetVector(buildings, buildingsCount, mill);
    buildingsCount++;
    
    vector miningCamp = new("Building");
    structSetString(miningCamp, "name", "Mining Camp");
    structSetInt(miningCamp, "id", 584);
    structSetInt(miningCamp, "playerCount", xsGetObjectCount(1, structGetInt(miningCamp, "id")));
    structSetFloat(miningCamp, "resourceCost", 100.0);
    xsArraySetVector(buildings, buildingsCount, miningCamp);
    buildingsCount++;
    
    vector lumberCamp = new("Building");
    structSetString(lumberCamp, "name", "Lumber Camp");
    structSetInt(lumberCamp, "id", 562);
    structSetInt(lumberCamp, "playerCount", xsGetObjectCount(1, structGetInt(lumberCamp, "id")));
    structSetFloat(lumberCamp, "resourceCost", 100.0);
    xsArraySetVector(buildings, buildingsCount, lumberCamp);
    buildingsCount++;
    
    vector dock = new("Building");
    structSetString(dock, "name", "Dock");
    structSetInt(dock, "id", 45);
    structSetInt(dock, "playerCount", xsGetObjectCount(1, structGetInt(dock, "id")));
    structSetFloat(dock, "resourceCost", 150.0);
    xsArraySetVector(buildings, buildingsCount, dock);
    buildingsCount++;
    
    vector farm = new("Building");
    structSetString(farm, "name", "Farm");
    structSetInt(farm, "id", 50);
    structSetInt(farm, "playerCount", xsGetObjectCount(1, structGetInt(farm, "id")));
    structSetFloat(farm, "resourceCost", 60.0);
    xsArraySetVector(buildings, buildingsCount, farm);
    buildingsCount++;
    
    vector fishTrap = new("Building");
    structSetString(fishTrap, "name", "Fish Trap");
    structSetInt(fishTrap, "id", 199);
    structSetInt(fishTrap, "playerCount", xsGetObjectCount(1, structGetInt(fishTrap, "id")));
    structSetFloat(fishTrap, "resourceCost", 100.0);
    xsArraySetVector(buildings, buildingsCount, fishTrap);
    buildingsCount++;

    vector market = new("Building");
    structSetString(market, "name", "Fish Trap");
    structSetInt(market, "id", 84);
    structSetInt(market, "playerCount", xsGetObjectCount(1, structGetInt(market, "id")));
    structSetFloat(market, "resourceCost", 175.0);
    xsArraySetVector(buildings, buildingsCount, market);
    buildingsCount++;

    xsEffectAmount(cSetAttribute, structGetInt(townCenter, "id"), cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, structGetInt(house, "id"), cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, structGetInt(mill, "id"), cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, structGetInt(miningCamp, "id"), cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, structGetInt(lumberCamp, "id"), cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, structGetInt(dock, "id"), cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, structGetInt(farm, "id"), cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, structGetInt(fishTrap, "id"), cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, structGetInt(market, "id"), cDisabledFlag, 1, 1);
}

void InitBuildsanityTech() {
    xsEffectAmount(cSetAttribute, university, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, blacksmith, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, monastery, cDisabledFlag, 1, 1);
}

void InitBuildsanityMilitary() {
    xsEffectAmount(cSetAttribute, barracks, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, archeryRange, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, siegeWorkshop, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, stable, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, castle, cDisabledFlag, 1, 1);
}

void InitBuildsanityDefense() {
    xsEffectAmount(cSetAttribute, palisadeGate, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, gate, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, palisadeWall, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, wall, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, watchTower, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, bombardTower, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, castle, cDisabledFlag, 1, 1);
}

void InitBuildsanityUniqueEcon() {
    xsEffectAmount(cSetAttribute, muleCart, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, harbor, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, feitoria, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, folwark, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, pasture, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, caravanserai, cDisabledFlag, 1, 1);
}

void InitBuildsanityUniqueMilitaryOrDefense() {
    xsEffectAmount(cSetAttribute, krepost, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, donjon, cDisabledFlag, 1, 1);
    xsEffectAmount(cSetAttribute, fortifiedChurch, cDisabledFlag, 1, 1);
}

void InitBuildsanity(bool econ = false, bool tech = false, bool mil = false, bool def = false, bool unique = false) {
    xsChatData("This Should Only Appear Once: %d", econ);
    InitBuildsanityStructs();
    InitBuildsanityAlways();
    if (econ == true) {
        InitBuildsanityEconomy();
    }
    if (tech == true) {
        InitBuildsanityTech();
    }
    if (mil == true) {
        InitBuildsanityMilitary();
    }
    if (def == true) {
        InitBuildsanityDefense();
    }
    if (unique == true) {
        if (econ == false && mil == false && def == false) {
            InitBuildsanityUniqueEcon();
            InitBuildsanityUniqueMilitaryOrDefense();
        }
        else {
            if (econ == true) {
                InitBuildsanityUniqueEcon();
            }
            if (mil == true || def == true) {
                InitBuildsanityUniqueMilitaryOrDefense();
            }
        }
    }
    xsEnableRule("BuildsanityChecks");
}

int monasteryCount = 0;

rule BuildsanityChecks
    inactive
    group Buildsanity
    highFrequency
{
    float buildingTotalCost = xsPlayerAttribute(1, cAttributeValueCurrentBuildings);

    if (structGetFloat(buildsanity, "currentBuildingTotalCost") > buildingTotalCost) {
        structSetFloat(buildsanity, "currentBuildingTotalCost", buildingTotalCost);
        return;
    }

    if (buildingTotalCost - structGetFloat(buildsanity, "currentBuildingTotalCost") == 175.0) {
        if (xsGetObjectCount(1, monastery) > monasteryCount) {
            xsChatData("Monastery");
        }
        xsChatData("175");
    }

    structSetFloat(buildsanity, "currentBuildingTotalCost", buildingTotalCost);
    monasteryCount = xsGetObjectCount(1, monastery);

    int buildings = structGetInt(buildsanity, "buildings");
    xsChatData("Buildingsanity vector x: %d", xsVectorGetX(buildsanity));
    xsChatData("Buildingsanity vector y: %d", xsVectorGetY(buildsanity));
    xsChatData("Buildingsanity vector z: %d", xsVectorGetZ(buildsanity));
    xsChatData("Buildings int: %d", buildings);
    vector tc = xsArrayGetVector(buildings, 2);
    printStructInstance(tc);
}