void FILLER_WOOD_SMALL() {
    xsEffectAmount(cModResource, cAttributeWood, cAttributeAdd, 100.0);
}

void FILLER_FOOD_SMALL() {
    xsEffectAmount(cModResource, cAttributeFood, cAttributeAdd, 100.0);
}

void FILLER_GOLD_SMALL() {
    xsEffectAmount(cModResource, cAttributeGold, cAttributeAdd, 100.0);
}

void FILLER_STONE_SMALL() {
    xsEffectAmount(cModResource, cAttributeStone, cAttributeAdd, 100.0);
}

void GiveResource(int itemId = -1) {
    switch(itemId) {
        case 1: {
            FILLER_WOOD_SMALL();
        }
        case 2: {
            FILLER_FOOD_SMALL();
        }
        case 3: {
            FILLER_GOLD_SMALL();
        }
        case 4: {
            FILLER_STONE_SMALL();
        }
    }
}