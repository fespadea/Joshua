// set attack

// set up Dattack variable
if(attack == AT_DATTACK) finishDattack = false;

// set up Uair variable
if(attack == AT_UAIR) finishUair = false;

// change to batitless dspecial
if(attack == AT_DSPECIAL && batitDelay > 0){
    if (free) attack = AT_DSPECIAL_AIR;
    else attack = AT_DSPECIAL_2;
}

// change to batitless uspecial
if(attack == AT_USPECIAL && batitDelay > 0){
    attack = AT_USPECIAL_2;
}

// change to batitfull fspecial (this is reversed because batitless was made first)
if(attack == AT_FSPECIAL && batitDelay < 1){
    attack = AT_FSPECIAL_2;
}

// nspecial batit projectile
if (attack == AT_NSPECIAL && batitDelay > 0 && move_cooldown[AT_NSPECIAL] < 1){
    if(batitPlaced){
        with batitArticle{
            if(state == 0){
                state = 9;
                state_timer = 0;
                other.move_cooldown[AT_NSPECIAL] = 300;
            } else other.move_cooldown[AT_NSPECIAL] = 2;
        }
    } else move_cooldown[AT_NSPECIAL] = 2;
}

// batit fstrong
if (attack == AT_FSTRONG && batitDelay > 0){
    if(batitPlaced){
        attack_end();
        with batitArticle{
            switch(state){
                case 3:
                    if(bumpBox != noone){
                        bumpBox.length = 0;
                        bumpBox = noone;
                    }
                    hitByDTilt = false;
                case 0:
                    state = 10;
                    state_timer = 0;
                break;
            }
        }
    }
    move_cooldown[AT_FSTRONG] = 2;
    unturn = true;
    batitArticle.strongDir = spr_dir;
}

// batit ustrong
if (attack == AT_USTRONG && batitDelay > 0){
    if(batitPlaced){
        with batitArticle{
            switch(state){
                case 3:
                    if(bumpBox != noone){
                        bumpBox.length = 0;
                        bumpBox = noone;
                    }
                    hitByDTilt = false;
                case 0:
                    state = 11;
                    state_timer = 0;
                break;
            }
        }
    }
    move_cooldown[AT_USTRONG] = 2;
    unturn = true;
    batitArticle.strongDir = spr_dir;
}

if(attack == AT_DSTRONG) {
    prevSprDir = spr_dir;
}