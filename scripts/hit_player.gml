//hit player

// uair is a pseudo-multiperson-grab
if(my_hitboxID.attack == AT_UAIR && my_hitboxID.hbox_num > 1 && my_hitboxID.hbox_num < get_num_hitboxes(AT_UAIR)){
    if(my_hitboxID.hbox_num == 2){
        finishUair = true;
        if(!hit_player_obj.clone && hit_player_obj.hitstun > 0){
            uairGrabbedid[hit_player, 0] = hit_player_obj;
            uairGrabbedid[hit_player, 0].grabbed = 1;
            uairGrabbedid[hit_player, 0].ungrab = 0;
            uairGrabbedid[hit_player, 1] = hit_player_obj.x - x;
            uairGrabbedid[hit_player, 2] = hit_player_obj.y - y;
        }
    }
} else {
    uairGrabbedid[hit_player, 0] = noone;
}

// command grab (template)
if (my_hitboxID.attack == AT_FSPECIAL){
    if(my_hitboxID.hbox_num == 1){
        if(!hit_player_obj.clone && hit_player_obj.hitstun > 0){
            grabbedid = hit_player_obj;
            grabbedid.grabbed = 1;
            grabbedid.ungrab = 0;
            window = 5;
            window_timer = 0;
            my_hitboxID.length = 0;
        }
    } else if(my_hitboxID.hbox_num == 2){
        grabbedid = noone;
    }
} else if(hit_player_obj == grabbedid){
    if(grabbedid.state == PS_WRAPPED){
        grabbedid.state = PS_TUMBLE;
    }
    grabbedid = noone;
    window = 6;
    window_timer = 0;
    if(!runeI){
        hsp = -7*spr_dir;
        if(free){
            vsp = -1;
        }
    }
}

//dattack knockback control for better connecting
if(my_hitboxID.attack == AT_DATTACK && my_hitboxID.hbox_num < 4){
    if((hit_player_obj.x - (x+20*spr_dir))*spr_dir > 0){
        hit_player_obj.orig_knock = 6;
    }
    hit_player_obj.should_make_shockwave = false;
}

//uspecial knockback control for better connecting
if(my_hitboxID.attack == AT_USPECIAL && my_hitboxID.hbox_num > 2 && my_hitboxID.hbox_num < 13){
    if(hit_player_obj.y < y - char_height){
        hit_player_obj.orig_knock = 4;
    }
    hit_player_obj.should_make_shockwave = false;
}

// [Random alt on hit feature]
// Random alt on hit
if(randomAltOnHit){ // if "random alt on hit" activated
    updateUnlimitedAlt(random_func(10, NUM_UNLIMITED_ALTS, true), false); // update the unlimited alt to a random alt
    init_shader(); // update the alt visually
}



#define updateUnlimitedAlt
unlimitedAlt = argument[0];
if(argument_count > 1 && argument[1])
    set_color_profile_slot( 0, 8, get_color_profile_slot_r(0, 8), unlimitedAlt, get_color_profile_slot_b(0, 8) );
var prevVarVals = split_synced_var(FIRST_BIT_UNLIMITED, LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1, 31-LAST_BIT_UNLIMITED);
set_synced_var(player, generate_synced_var(prevVarVals[0], FIRST_BIT_UNLIMITED, unlimitedAlt, LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1, prevVarVals[2], 31-LAST_BIT_UNLIMITED));


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