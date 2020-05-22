// update

// don't allow dspecial/fstrong if batit is placed
if(batitPlaced){
    batitDelay = 2;
} else if(batitDied){
    batitDelay = 600;
    batitDied = false;
    batitFell = false;
} else if(batitFell){
    batitDelay = 300;
    batitFell = false;
}
if(batitDelay > 0){
    move_cooldown[AT_TAUNT] = 2;
    if(batitStats){
        walk_speed += .25;
        walk_accel += .05;
        initial_dash_speed += .5;
        dash_speed += .5;
        jump_speed += .5;
        short_hop_speed += .5;
        djump_speed += .5;
        leave_ground_max += .5;
        max_jump_hsp += .5;
        air_max_speed += .5;
        jump_change += .5;
        air_accel += .05;
        walljump_hsp += .5;
        walljump_vsp += .5;
        batitStats = false;
    }
} else {
    if(!batitStats){
        walk_speed -= .25;
        walk_accel -= .05;
        initial_dash_speed -= .5;
        dash_speed -= .5;
        jump_speed -= .5;
        short_hop_speed -= .5;
        djump_speed -= .5;
        leave_ground_max -= .5;
        max_jump_hsp -= .5;
        air_max_speed -= .5;
        jump_change -= .5;
        air_accel -= .05;
        walljump_hsp -= .5;
        walljump_vsp -= .5;
        batitStats = true;
    }
}
batitDelay--;

//new parry sound
if(state == PS_PARRY){
    sound_stop(asset_get("sfx_parry_use"));
    if(state_timer == 1) sound_play(sound_get("JoshuaParryUse"));
}

// reset air_accel
if(air_accel != tempAirAccel && !(state == PS_ATTACK_AIR && attack == AT_FSPECIAL_2)){
    air_accel = tempAirAccel;
}