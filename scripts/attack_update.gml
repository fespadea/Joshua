//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}
switch(attack){
    case AT_DSPECIAL: // place batit
        if(window == 1 && window_timer == get_window_value(AT_DSPECIAL, 1, AG_WINDOW_LENGTH) && !batitPlaced){
            batitArticle = instance_create(x+12*spr_dir, y, "obj_article1");
        }
        break;
    case AT_FSPECIAL: // pick up batit
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
        break;
    case AT_FTILT:
    case AT_FAIR:
    case AT_BAIR: // batit ftilt/fair/bair projectile
        if(state_timer == 1 && batitPlaced){
            with batitArticle{
                switch(state){
                    case 3:
                        if(bumpBox != noone){
                            bumpBox.length = 0;
                            bumpBox = noone;
                        }
                    case 0:
                        state = 1;
                        state_timer = 0;
                    break;
                }
            }
        }
        break;
    case AT_UTILT: // utilt/uair batit projectile
        if(state_timer == 1 && batitPlaced){
            with batitArticle{
                switch(state){
                    case 3:
                        if(bumpBox != noone){
                            bumpBox.length = 0;
                            bumpBox = noone;
                        }
                    case 0:
                        state = 7;
                        state_timer = 0;
                    break;
                }
            }
        }
        break;
    case AT_DATTACK: // made Dattack work in 2 parts
        if(window == get_attack_value(AT_DATTACK, AG_NUM_WINDOWS) - 1){
            if(finishDattack && !was_parried){
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
                if(!was_parried) set_state(PS_IDLE);
                else set_state(PS_PRATLAND);
            }
        } else if(window == get_attack_value(AT_DATTACK, AG_NUM_WINDOWS)){
            if(state_timer > dashAttackLength){
                can_jump = true;
                can_wall_jump = true;
            }
            if(y >= initialDattackY || !free){
                set_window_value(AT_DATTACK, get_attack_value(AT_DATTACK, AG_NUM_WINDOWS), AG_WINDOW_TYPE, 0);
            }
        }
        break;
    case AT_DSPECIAL_AIR: // change AT_DSPECIAL_AIR to land when landing
        if(!free){
            set_state(PS_LAND);
        }
        move_cooldown[AT_DSPECIAL_AIR] = 30;
        break;
    case AT_UAIR: // made Uair work in 2 parts
        if(state_timer == 1 && batitPlaced){
            with batitArticle{
                switch(state){
                    case 3:
                        if(bumpBox != noone){
                            bumpBox.length = 0;
                            bumpBox = noone;
                        }
                    case 0:
                        state = 7;
                        state_timer = 0;
                    break;
                }
            }
        } else if(window == 2 && window_timer == get_window_value(AT_UAIR, window, AG_WINDOW_LENGTH)){
            if(!finishUair) window = 4;
        }
        break;
    case AT_FSPECIAL_2: // FSPECIAL_2 stall in the air correctly
        if(window < 3 && free){
            if(window == 2 && window_timer == 1){
                vsp = -4;
                hsp = 4*spr_dir;
            }
            air_accel = .1;
        } else {
            air_accel = tempAirAccel;
        }
        break;
    case AT_DSPECIAL_2: // artificial attack charging (followed by the same code for AT_DSTRONG and AT_DTILT)
        if(window == 1 && state_timer > get_window_value(AT_DSPECIAL_2, window, AG_WINDOW_LENGTH)){
            if(strong_charge > 59 || !special_down){
                window = 2;
                window_timer = 0;
                sprite_index = dspecial2Sprite;
                set_hitbox_value(AT_DSPECIAL_2, 1, HG_DAMAGE, round(get_hitbox_value(AT_DSPECIAL_2, 1, HG_DAMAGE)*(1 + strong_charge/120)));
            }
            strong_charge++;
        }
    case AT_DSTRONG:
    case AT_DTILT: // allow dstrong/dtilt/dspecial_2 to be canceled if batit was kicked
        if(batitPlaced && batitArticle.state == 3 && batitArticle.state_timer > 1){
            can_attack = true;
            can_strong = true;
            can_ustrong = true;
            move_cooldown[AT_DTILT] = 2; //can't cancel into these moves
            move_cooldown[AT_DSTRONG] = 2;
            move_cooldown[AT_JAB] = 2;
            clear_button_buffer(PC_SPECIAL_PRESSED);
            if(joy_pad_idle && is_special_pressed(DIR_NONE)){
                set_attack(AT_NSPECIAL);
            }
        }
        break;
    case AT_EXTRA_1:
        if (compatibleUrl == 1932454633){ //this stuff is for the reverse TCO support, mostly copied over
            if(window_timer == 1 && window == 4){
                sound_stop(sound_get("pencilTCO"));
            } else if (window_timer == 18 && window == 7){
                drawingTimer = 179;
                move_cooldown[AT_EXTRA_1] = 179;
            }
        }
        break;
    case AT_USPECIAL_2:
        if(batitPlaced && place_meeting(x, y, batitArticle) && ((special_pressed && up_down) || is_special_pressed(3))){
            attack_end();
            set_hitbox_value(AT_USPECIAL, 13, HG_KNOCKBACK_SCALING, .5);
            set_hitbox_value(AT_USPECIAL, 13, HG_HITPAUSE_SCALING, .4);
            set_window_value(AT_USPECIAL, 4, AG_WINDOW_TYPE, 0);
            set_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED, -10);
            dontSwitchToUspecial = true;
            can_special = true;
            clear_button_buffer(PC_SPECIAL_PRESSED);
            special_pressed = true;
            up_down = true;
        }
    case AT_USPECIAL:
        can_wall_jump = true;
        break;
}