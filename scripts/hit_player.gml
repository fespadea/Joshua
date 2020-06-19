//hit player

// check whether to finish Dattack or not
if(my_hitboxID.attack == AT_DATTACK && my_hitboxID.hbox_num == get_num_hitboxes(AT_DATTACK) - 1){
    finishDattack = true;
}

// check whether to finish Uair or not
if(my_hitboxID.attack == AT_UAIR && my_hitboxID.hbox_num > 1 && my_hitboxID.hbox_num < get_num_hitboxes(AT_UAIR)){
    if(my_hitboxID.hbox_num == 2){
        finishUair = true;
        if(!hit_player_obj.clone){
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

// check whether you hit fspecial_2
if(my_hitboxID.attack == AT_FSPECIAL_2){
    whipHitPlayer = true;
}

// command grab (template)
if (my_hitboxID.attack == AT_FSPECIAL){
    if(my_hitboxID.hbox_num == 1){
        sound_play(asset_get("sfx_blow_weak1")); //this wouldn't play as the hitbox's hit sfx for some reason
        if(!hit_player_obj.clone){
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
    hsp = -7*spr_dir;
    if(free){
        vsp = -1;
    }
}

if(my_hitboxID.attack == AT_DATTACK && my_hitboxID.hbox_num < 4){
    if((hit_player_obj.x - (x+20*spr_dir))*spr_dir > 0){
        hit_player_obj.orig_knock = 6;
    }
    hit_player_obj.should_make_shockwave = false;
}

if(my_hitboxID.attack == AT_USPECIAL && my_hitboxID.hbox_num > 2 && my_hitboxID.hbox_num < 13){
    if(hit_player_obj.y < y - char_height){
        hit_player_obj.orig_knock = 4;
    }
    hit_player_obj.should_make_shockwave = false;
}