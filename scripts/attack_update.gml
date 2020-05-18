//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

// place batit
if (attack == AT_DSPECIAL){
    if(window == 1 && window_timer == get_window_value(AT_DSPECIAL, 1, AG_WINDOW_LENGTH) && !batitPlaced)
        batitArticle = instance_create(x+12*spr_dir, y, "obj_article1");
}

// pick up batit
if (attack == AT_FSPECIAL){
    if(window == 2 && window_timer == get_window_value(AT_FSPECIAL, window, AG_WINDOW_LENGTH) && pickUpBatit){
        move_cooldown[AT_NSPECIAL] = 0;
        batitArticle.state = 2;
        pickUpBatit = false;
        window = 4;
        window_timer = 0;
    } else if(window == 3 && window_timer == get_window_value(AT_FSPECIAL, window, AG_WINDOW_LENGTH)) {
        if(free) set_state(PS_IDLE_AIR);
        else set_state(PS_IDLE);
    }
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

// made Dattack work in 2 parts
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

// change AT_DSPECIAL_2 to land when landing
if(attack == AT_DSPECIAL_2 && !free){
    set_state(PS_LAND);
}

// made Uair work in 2 parts
if(attack == AT_UAIR){
    if(window == 2 && window_timer == get_window_value(AT_UAIR, window, AG_WINDOW_LENGTH)){
        if(!finishUair) window = 4;
    }
}

// FSPECIAL_2 stall in the air correctly
if(attack == AT_FSPECIAL_2){
    if(window < 3 && free){
        if(window == 2 && window_timer == 1) vsp = -3;
        air_accel = .1;
    } else air_accel = tempAirAccel;
}