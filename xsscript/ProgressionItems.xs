void GiveProgressionItem(int itemId) {
    switch(itemId) {
        case 1000: {
            TOWN_CENTER_WOOD();
        }
        case 1001: {
            TOWN_CENTER_STONE();
        }
        case 1002: {
            AP_ATTILA_2_VILLAGERS_TRIGGER();
        }
    }
}

//General Items
TOWN_CENTER_WOOD() {
    xsEffectAmount(cModResource, cAttributeWood, cAttributeAdd, 275)
}

TOWN_CENTER_STONE() {
    xsEffectAmount(cModResource, cAttributeStone, cAttributeAdd, 100)
}

// Scenario-specific items
AP_ATTILA_2_VILLAGERS_TRIGGER() {
    xsSetTriggerVariable(3, 1)
}