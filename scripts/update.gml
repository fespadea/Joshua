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
    move_cooldown[AT_USTRONG] = 2;
    move_cooldown[AT_TAUNT] = 2;
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