//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

if (attack == AT_NSPECIAL){
    if (window == 3){
        if (special_pressed){
            window = 1;
            window_timer = 0;
        }
    }
}

if (attack == AT_FSPECIAL){
    if(state_timer == 1 && batitPlaced){
        if(batitArticle.state == 0 && place_meeting(x, y, batitArticle)) batitArticle.state = 2;
    }
}

if (attack == AT_USPECIAL){
    if (window == 1 && window_timer == 1){
        times_through = 0;
    }
    if (window == 2){
        if (window_timer == get_window_value(attack, 2, AG_WINDOW_LENGTH)){
            if (times_through < 10){
                times_through++;
                window_timer = 0;
            }
        }
        if (!joy_pad_idle){
            hsp += lengthdir_x(1, joy_dir);
            vsp += lengthdir_y(1, joy_dir);
        } else {
            hsp *= .6;
            vsp *= .6;
        }
        var fly_dir = point_direction(0,0,hsp,vsp);
        var fly_dist = point_distance(0,0,hsp,vsp);
        var max_speed = 12;
        if (fly_dist > max_speed){
            hsp = lengthdir_x(max_speed, fly_dir);
            vsp = lengthdir_y(max_speed, fly_dir);
        }
        if (special_pressed && times_through > 0){
            window = 4;
            window_timer = 0;
        }
        if (shield_pressed){
            window = 3;
            window_timer = 0;
        }
    }
    if (window > 3 && window < 6 && window_timer == get_window_value(attack, window, AG_WINDOW_LENGTH)){
        window++;
        window_timer = 0;
    }
}

if (attack == AT_DSPECIAL){
    if(window == 1 && window_timer == get_window_value(AT_DSPECIAL, 1, AG_WINDOW_LENGTH) && !batitPlaced)
        batitArticle = instance_create(x+12*spr_dir, y, "obj_article1");
}

// batit ftilt/fair/bair projectile
if (attack == AT_FTILT || attack == AT_FAIR || attack == AT_BAIR){
    if(state_timer == 1 && batitPlaced){
        with batitArticle{
            if(state == 0){
                state = 1;
                state_timer = 0;
            }
        }
    }
}

// utilt batit projectile
if (attack == AT_UTILT){
    if(state_timer == 1 && batitPlaced){
        with batitArticle{
            if(state == 0){
                state = 7;
                state_timer = 0;
            }
        }
    }
}


if(attack == AT_DATTACK){
    if(window == get_attack_value(AT_DATTACK, AG_NUM_WINDOWS) - 1){
        if(finishDattack){
            if(window_timer == 1) sound_play(asset_get("sfx_swipe_heavy1"));
            else if(window_timer > 4){
                set_window_value(AT_DATTACK, get_attack_value(AT_DATTACK, AG_NUM_WINDOWS), AG_WINDOW_TYPE, 9);
                window = get_attack_value(AT_DATTACK, AG_NUM_WINDOWS);
                window_timer = 0;
                initialDattackY = y;
                vsp = -6;
            }
        } else if (window_timer == get_window_value(AT_DATTACK, get_attack_value(AT_DATTACK, AG_NUM_WINDOWS) - 1, AG_WINDOW_LENGTH) - 1){
            spr_dir *= -1;
            set_state(PS_IDLE);
        }
    } else if(window == get_attack_value(AT_DATTACK, AG_NUM_WINDOWS)){
        if(y >= initialDattackY || !free){
            set_window_value(AT_DATTACK, get_attack_value(AT_DATTACK, AG_NUM_WINDOWS), AG_WINDOW_TYPE, 0);
        }
    }
}