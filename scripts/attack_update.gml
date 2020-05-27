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
        } else if((window == 3 || window == 4) && window_timer == get_window_value(AT_FSPECIAL, window, AG_WINDOW_LENGTH)) {
            if(was_parried) set_state(PS_PRATLAND);
            else if(free) set_state(PS_IDLE_AIR);
            else set_state(PS_IDLE);
        } else if (window == 5){
            pickUpBatit = false;
            grabbedid.x = x + 45*spr_dir + hsp;
            grabbedid.y = y + vsp;
            grabbedid.spr_dir = -spr_dir;
            grabbedid.wrap_time = 6000;
            grabbedid.state = PS_WRAPPED;
            grabbedid.ungrab++;
            if(special_pressed || grabbedid.ungrab == 60 || (grabbedid.ungrab == 30 && free)){
                grabbedid.state = PS_TUMBLE;
                grabbedid = noone;
                window = 6;
                window_timer = 0;
                hsp = -5*spr_dir;
                if(free){
                    vsp = -1;
                }
            }
        }
        break;
    case AT_FTILT: // batit ftilt projectile
        if(state_timer <= 6 && batitPlaced){
            if(!attack_down && ((!right_stick_down && spr_dir == 1) || (!left_stick_down && spr_dir == -1))){
                doAttack = false;
            }
            if((state_timer == 6 || projectilesMandatory) && doAttack)
                batitAttack(1, spr_dir);
        }
        break;
    case AT_FAIR: // batit fair projectile
        if(state_timer <= 6 && batitPlaced){
            if(!strong_down && ((!right_strong_down && spr_dir == 1) || (!left_strong_down && spr_dir == -1))){
                doStrong = false;
            }
            if(!attack_down && ((!right_stick_down && spr_dir == 1) || (!left_stick_down && spr_dir == -1))){
                doAttack = false;
            }
            if((state_timer == 6 || strongsMandatory) && doStrong)
                batitAttack(10, spr_dir);
            else if((state_timer == 6 || projectilesMandatory) && doAttack && ((!right_strong_down && spr_dir == 1) || (!left_strong_down && spr_dir == -1)))
                batitAttack(1, spr_dir);
        }
        break;
    case AT_BAIR: // batit bair projectile
        if(state_timer <= 6 && batitPlaced){
            if(!strong_down && ((!right_strong_down && spr_dir == -1) || (!left_strong_down && spr_dir == 1))){
                doStrong = false;
            }
            if(!attack_down && ((!right_stick_down && spr_dir == -1) || (!left_stick_down && spr_dir == 1))){
                doAttack = false;
            }
            if((state_timer == 6 || strongsMandatory) && doStrong)
                batitAttack(10, -spr_dir);
            else if((state_timer == 6 || projectilesMandatory) && doAttack && ((!right_strong_down && spr_dir == -1) || (!left_strong_down && spr_dir == 1)))
                batitAttack(1, -spr_dir);
        }
        break;
    case AT_UTILT: // utilt/uair batit projectile
        if(state_timer <= 6 && batitPlaced){
            if(!attack_down && !up_stick_down){
                doAttack = false;
            }
            else if((state_timer == 6 || projectilesMandatory) && doAttack)
                batitAttack(7, 1); // direction doesn't matter here
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
        if(state_timer <= 6 && batitPlaced){
            if(!strong_down && !up_strong_down){
                doStrong = false;
            }
            if(!attack_down && !up_stick_down){
                doAttack = false;
            }
            if((state_timer == 6 || strongsMandatory) && doStrong)
                batitAttack(11, 1); // direction doesn't matter here
            else if((state_timer == 6 || projectilesMandatory) && doAttack && !up_strong_down)
                batitAttack(7, 1); // direction doesn't matter here
        } else if(window == 2 && window_timer == get_window_value(AT_UAIR, window, AG_WINDOW_LENGTH)){
            if(!finishUair) window = 4;
        }
        break;
    case AT_FSPECIAL_2: // pulls in on hit
        if(window == 2 && whipHitPlayer && !was_parried){
            window = 4;
            window_timer = 0;
            can_jump = true;
            can_attack = true;
            can_wall_jump = true;
            can_strong  = true;
            can_ustrong = true;
            can_shield = true;
        } else if(window == 3 && window_timer == get_window_value(AT_FSPECIAL_2, window, AG_WINDOW_LENGTH)){
            if(was_parried) set_state(PS_PRATLAND);
            else if(free) set_state(PS_IDLE_AIR);
            else set_state(PS_IDLE);
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
        if(batitPlaced && place_meeting(x, y, batitArticle) && (special_pressed || is_special_pressed(3))){
            attack_end();
            set_hitbox_value(AT_USPECIAL, 13, HG_KNOCKBACK_SCALING, .5);
            set_hitbox_value(AT_USPECIAL, 13, HG_HITPAUSE_SCALING, .4);
            set_window_value(AT_USPECIAL, 4, AG_WINDOW_TYPE, 0);
            set_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED, -10);
            dontSwitchToUspecial = true;
            set_attack(AT_USPECIAL)
        }
    case AT_USPECIAL:
        can_wall_jump = true;
        break;
}

#define batitAttack(newState, newDir)
with batitArticle {
    switch(state){
        case 3:
            if(bumpBox != noone){
                bumpBox.length = 0;
                bumpBox = noone;
            }
        case 0:
            attackDir = newDir;
            state = newState;
            state_timer = 0;
        break;
    }
}