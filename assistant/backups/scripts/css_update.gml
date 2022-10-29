// css update

var curGameAlt = get_player_color(player); // the current base game alt
unlimitedAlt = (split_synced_var(FIRST_BIT, LAST_BIT-FIRST_BIT+1, 31-LAST_BIT)[1] << 5) + curGameAlt; // the currently selected alt

if(curGameAlt != prevAlt){ // you switched alt
    if((curGameAlt > prevAlt && curGameAlt < prevAlt + 8) || curGameAlt < prevAlt - 8){ // You increased your alt. This accounts for going from the highest alt to the smallest alt and skipping alts because of other players.
        unlimitedAlt++; // increase your unlimited alt
        if(unlimitedAlt == array_length(altName)){ // if you've passed the number of unlimited alts you have
            unlimitedAlt = 0; // reset your unlimited alt to the default alt
        }

    } else{ // You decreased your alt. This accounts for going from the smallest alt to the highest alt and skipping alts because of other players.
        if(unlimitedAlt == 0){ // if you're the smallest unlimited alt
            unlimitedAlt = array_length(altName); // set the current alt to the number of alts you have (this will get decreased since you start counting alts at 0)
        }
        unlimitedAlt--; // decrease your unlimited alt
    }
    prevAlt = curGameAlt;
}

var prevVarVals = split_synced_var(FIRST_BIT, LAST_BIT-FIRST_BIT+1, 31-LAST_BIT)
set_synced_var(player, generate_synced_var(prevVarVals[0], FIRST_BIT, unlimitedAlt >> 5, LAST_BIT-FIRST_BIT+1, prevVarVals[2], 31-LAST_BIT));


// You don't need this if you don't have a rainbow alt [Edit optional]
// rainbow alt
#macro RAINBOW_ALT 32
if(unlimitedAlt == RAINBOW_ALT){ // check that you've selected the rainbow alt [Edit necessary]
    init_shader(); // run init_shader to update the hue
}


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