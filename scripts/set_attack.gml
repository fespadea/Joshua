// set attack

switch(attack){
    case AT_DATTACK: // set up Dattack variable
        finishDattack = false;
        break;
    case AT_UAIR: // set up Uair variable
        finishUair = false;
    case AT_BAIR:
    case AT_FAIR:
        doStrong = true;
    case AT_UTILT:
    case AT_FTILT:
        doAttack = true;
        break;
    case AT_DSPECIAL: // change to batitless dspecial
        if(batitDelay > 0){
            if (free){
                attack = AT_DSPECIAL_AIR;
                attack_end();
            } else{
                attack = AT_DSPECIAL_2;
                set_hitbox_value(AT_DSPECIAL_2, 1, HG_DAMAGE, 9);
            }
        }
        break;
    case AT_USPECIAL: // change to batitless uspecial
        if(batitDelay > 0){
            if(dontSwitchToUspecial){
                dontSwitchToUspecial = false;
                window = 3;
            } else {
                attack = AT_USPECIAL_2;
                clear_button_buffer(PC_SPECIAL_PRESSED);
            }
        }
        break;
    case AT_FSPECIAL: // change to batitfull fspecial (this is reversed because batitless was made first)
        if(batitDelay < 1){
            attack = AT_FSPECIAL_2;
            whipHitPlayer = false;
        }
        break;
    case AT_NSPECIAL: // nspecial batit projectile
        if (batitDelay > 0 && move_cooldown[AT_NSPECIAL] < 1){
            if(batitPlaced){
                with batitArticle{
                    switch(state){
                        case 3:
                            if(bumpBox != noone){
                                bumpBox.length = 0;
                                bumpBox = noone;
                            }
                        case 0:
                            state = 9;
                            state_timer = 0;
                            other.move_cooldown[AT_NSPECIAL] = 300;
                            break;
                        default:
                            other.move_cooldown[AT_NSPECIAL] = 2;
                    }
                }
            } else move_cooldown[AT_NSPECIAL] = 2;
        }
        break;
    case AT_FSTRONG: // batit fstrong
        if (batitDelay > 0){
            if(batitPlaced){
                attack_end();
                with batitArticle{
                    switch(state){
                        case 3:
                            if(bumpBox != noone){
                                bumpBox.length = 0;
                                bumpBox = noone;
                            }
                        case 0:
                            state = 10;
                            state_timer = 0;
                        break;
                    }
                }
            }
            move_cooldown[AT_FSTRONG] = 2;
            unturn = true;
            batitArticle.attackDir = spr_dir;
        }
        break;
    case AT_USTRONG: // batit ustrong
        if (batitDelay > 0){
            if(batitPlaced){
                with batitArticle{
                    switch(state){
                        case 3:
                            if(bumpBox != noone){
                                bumpBox.length = 0;
                                bumpBox = noone;
                            }
                        case 0:
                            state = 11;
                            state_timer = 0;
                        break;
                    }
                }
            }
            move_cooldown[AT_USTRONG] = 2;
            unturn = true;
            batitArticle.attackDir = spr_dir;
        }
        break;
    case AT_DSTRONG:
        prevSprDir = spr_dir;
        break;
    case AT_TAUNT: //reverse compatibility taunts
        if(compatibleUrl && down_down){
            attack = AT_EXTRA_1;
        } else if(batitDelay > 0){
            attack = AT_TAUNT_2;
        }
        break;
}