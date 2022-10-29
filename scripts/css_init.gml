// css init

// player is set to 0 online
onlineCSS = player == 0; // true if on the online CSS

/*
These are the variables to decide which bits of the synced variable you want to dedicate
to allowing more alts (from bit 0 to 31). You likely aren't using this if you don't 
know what it is, so you don't need to touch it if you don't. [Edit necessary]
*/
FIRST_BIT_UNLIMITED = 0;
LAST_BIT_UNLIMITED = 31;

// get selected unlimited alt
unlimitedAlt = -1;
var prevVarVals = split_synced_var(FIRST_BIT_UNLIMITED, LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1, 31-LAST_BIT_UNLIMITED);
set_synced_var(player, generate_synced_var(prevVarVals[0], FIRST_BIT_UNLIMITED, unlimitedAlt, LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1, prevVarVals[2], 31-LAST_BIT_UNLIMITED));
prevAlt = get_player_color(player);


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

#define generate_synced_var
///args chunks...
///Given pairs of chunks and their lengths in bits, compiles them into one value.
//arg format: chunk, bit_length, chunk, bit_length, etc.
var output = 0;
var num_chunks = argument_count/2;
if num_chunks != floor(num_chunks) {
    print("error generating synced var - function formatted wrong.");
    return 0;
}
var total_len = 0;
for (var i = num_chunks-1; i >= 0; i--) {
    var pos = (i*2);
    var shift = (pos-1 >= 0) ? argument[pos-1] : 0;
    total_len += argument[pos+1];
    output = output | argument[pos];
    output = output << shift;
}
if total_len > 32 {
    print(`error generating synced var - bit length surpassed 32! (${total_len} bits.)`);
    return 0;
}
return real(output);