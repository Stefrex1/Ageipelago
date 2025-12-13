include "./ProgressionItems.xs";
include "./ResourceItems.xs";


int itemArray = -1;
int locationArray = -1;

int clientPing = -1;
int lastPing = -1;
int pingRepeatCount = 0;

float protocol = -1;
int worldId = -1;
int lastMessageId = -1;

void AP_init()
{
    itemArray = xsArrayCreateInt(12, -1, "Item Array");
    locationArray = xsArrayCreateInt(0, -1, "Location Array");
}

void AP_Write()
{
    xsCreateFile(false);
    xsWriteInt(1);
    xsWriteInt(xsGetGameTime());
    xsWriteFloat(protocol);
    xsWriteInt(worldId); 
    xsWriteInt(lastMessageId);
    for (i = 0; < 12) {
        xsWriteInt(xsArrayGetInt(itemArray, i));
    }
    for (i = 0; < 31) {
    xsWriteInt(i);
    }
    for (i = 0; < xsArrayGetSize(locationArray)) {
        xsWriteInt(xsArrayGetInt(locationArray, i));
    }
    xsCloseFile();
}

void AP_Read()
{
    xsOpenFile("AP");
    clientPing = xsReadInt();
    protocol = xsReadFloat();
    worldId = xsReadInt();
    int items = xsReadInt();
    if (items == 1) {
        xsEnableRule("ReadItems");
    }
    int units = xsReadInt();
    int messages = xsReadInt();
    xsCloseFile();
}

void AP_Check_Location(int locationId = -1)
{
    xsChatData("Location Id : %d", locationId);
    int locationSize = xsArrayGetSize(locationArray);
    xsChatData("Location Array Size : %d", locationSize);
    xsArrayResizeInt(locationArray, locationSize + 1);
    xsArraySetInt(locationArray, locationSize, locationId);
    xsChatData("Location Id : %d", xsArrayGetInt(locationArray, locationSize));
}

// This rule prints the value of a every 2 seconds.
rule ReadAP
    active
    minInterval 1
    maxInterval 1
{
    AP_Read();
    if (clientPing > lastPing) {
        pingRepeatCount = 0;
    }
    else {
        pingRepeatCount++;
    }

    if (pingRepeatCount >= 5) {
        xsChatData("<RED>AP Client disconnected. Cannot send locations or receive items until connection is reestablised.");
    }
}

rule ReadItems
    inactive
    minInterval 1
    maxInterval 1
{
    xsOpenFile("Items");
    for (i = 0; < 12) {
        int itemId = xsReadInt();
        GiveItem(itemId);
    }
    xsCloseFile();
    xsDisableSelf();
}

void GiveItem(int itemId = -1) {
    if (itemId <= 25) {
        GiveResource(itemId);
    }
    if (itemId >= 1000 || itemId < 3000) {
        GiveProgressionItem(itemId);
    }
}