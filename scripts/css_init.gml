// css init

// player is set to 0 online
onlineCSS = player == 0; // true if on the online CSS



/*
These are the variables to decide which bits of the synced variable you want to dedicate
to allowing more alts (from bit 0 to 31). You likely aren't using this if you don't 
know what it is, so you don't need to touch it if you don't. [Edit necessary]
*/
FIRST_BIT_UNLIMITED = 0;
LAST_BIT_UNLIMITED = 28;

// get selected unlimited alt
if(init == 1 || "markLoaded" in self){
    unlimitedAlt = 0;
    updateUnlimitedAlt();
    bools = [0,0,1];
} else{
    unlimitedAlt = split_synced_var(FIRST_BIT_UNLIMITED, LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1, 31-LAST_BIT_UNLIMITED)[1];
    bools = split_synced_var(FIRST_BIT_UNLIMITED, LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1, 1,1,1);
    bools = [bools[2],bools[3],bools[4]];
}
prevAlt = get_player_color(player);
init_shader();
markLoaded = 0;

// base x and y values
temp_x = x + 8;
temp_y = y + 9;

// css UI sprites
cssUnlimitedScrollButton = sprite_get("css_unlimited_scroll_button");
sprite_change_offset( "css_unlimited_scroll_button", 0,  0);
cssUnlimitedScrollButtonDivision = sprite_get("css_unlimited_scroll_button_division");
sprite_change_offset( "css_unlimited_scroll_button_division", 0,  0);

holdUnlimitedUpButton = false;
holdUnlimitedDownButton = false;
altSwitchSound = asset_get("mfx_change_color");

unlimitedUpButtonX = temp_x+182;
unlimitedUpButtonY = temp_y+88;
unlimitedDownButtonX = unlimitedUpButtonX;
unlimitedDownButtonY = unlimitedUpButtonY+34;

//Alt names [Edit necessary]
altName = [];
altName[0]  = "Default"; // these are Joshua's alt names
altName[1]  = "Hime";
altName[2]  = "Liz";
altName[3]  = "Acid Rainbows";
altName[4]  = "Donyoku";
altName[5]  = "Pomme";
altName[6]  = "Abyss";
altName[7]  = "Early Access";
altName[8]  = "Contest One";
altName[9]  = "Sans";
altName[10]  = "Contest Three";
altName[11]  = "Contest Four";
altName[12]  = "Voidfox";
altName[13]  = "Classic";
altName[14]  = "Giik";
altName[15]  = "Kris";
altName[16]  = "Obama";
altName[17]  = "Wireframe";
altName[18]  = "Ellie";
altName[19]  = "Adam Carra";
altName[20]  = "Junior High";
altName[21]  = "Zircon";
altName[22]  = "Sakurai";
altName[23]  = "Lucy";
altName[24]  = "Starfy";
altName[25]  = "Yes, Indeed";
altName[26]  = "Smolburn";
altName[27]  = "Minicane";
altName[28]  = "Wrastiny";
altName[29]  = "MunchKragg";
altName[30]  = "Buch";
altName[31]  = "Feri";
altName[32]  = "Rainbow";
altName[array_length(altName)]  = "Random"; // Only put as many names as you have alts




// Toggle Sprites
toggleIconSprite = sprite_get("toggle_icon");
toggleLabelRightSprite = sprite_get("toggle_label_right");
toggleLabelLeftSprite = sprite_get("toggle_label_left");
sprite_change_offset( "toggle_label_left", sprite_get_width(toggleLabelLeftSprite), 0);
toggleLabelCenterSprite = sprite_get("toggle_label_center");

projectileMandatoryToggleSpriteX = temp_x+182;
projectileMandatoryToggleSpriteY = temp_y+24;
strongsMandatoryToggleSpriteX = projectileMandatoryToggleSpriteX;
strongsMandatoryToggleSpriteY = projectileMandatoryToggleSpriteY+22;
autoNudgeToggleSpriteX = projectileMandatoryToggleSpriteX;
autoNudgeToggleSpriteY = strongsMandatoryToggleSpriteY+22;

// Toggle booleans
projectilesMandatory = bools[0] == 1;
strongsMandatory = bools[1] == 1;
autoNudge = bools[2] == 1;

holdToggle = false; // holding a toggle boolean

LABEL_SPEED = 15;
hoverProjectilesMandatory = 0;
LABEL_PROJECTILE_MANDATORY_WIDTH = 26;
hoverStrongsMandatory = 0;
LABEL_STRONG_MANDATORY_WIDTH = 26;
hoverAutoNudge = 0;
LABEL_AUTO_NUDGE_WIDTH = 22;


#define updateUnlimitedAlt
var syncedVar = get_synced_var(player);
var newSyncedVar = 0;
newSyncedVar += syncedVar >> (LAST_BIT_UNLIMITED+1) << (LAST_BIT_UNLIMITED+1);
newSyncedVar += (unlimitedAlt & ((1 << (LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1))-1)) << FIRST_BIT_UNLIMITED;
newSyncedVar += syncedVar & ((1 << (FIRST_BIT_UNLIMITED))-1);
set_synced_var(player, newSyncedVar);
init_shader();

#define split_synced_var
///args chunk_lengths...
var num_chunks = argument_count;
var chunk_arr = array_create(argument_count);
var synced_var = get_synced_var(player);
var chunk_offset = 0
for (var i = 0; i < num_chunks; i++) {
    var chunk_len = argument[i]; //print(chunk_len);
    var chunk_mask = (1 << chunk_len)-1
    chunk_arr[i] = (synced_var >> chunk_offset) & chunk_mask;
    //print(`matching shift = ${chunk_len}`);
    chunk_offset += chunk_len;
}
// print(chunk_arr);
return chunk_arr;