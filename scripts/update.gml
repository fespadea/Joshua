// update

// don't allow dspecial/fstrong if batit is placed
if(batitPlaced){
    move_cooldown[AT_DSPECIAL] = 2;
    move_cooldown[AT_FSTRONG] = 2;
    move_cooldown[AT_USTRONG] = 2;
} else if(batitDied){
    move_cooldown[AT_DSPECIAL] = 600;
    batitDied = false;
    batitFell = false;
} else if(batitFell){
    move_cooldown[AT_DSPECIAL] = 300;
    batitFell = false;
}

//new parry sound
if(state == PS_PARRY){
    sound_stop(asset_get("sfx_parry_use"));
    if(state_timer == 1) sound_play(sound_get("JoshuaParryUse"));
}