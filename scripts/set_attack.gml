// set attack

// set up Dattack variable
if(attack == AT_DATTACK) finishDattack = false;

// set up Uair variable
if(attack == AT_UAIR) finishUair = false;

// change to batitless dspecial
if(attack == AT_DSPECIAL && batitDelay > 0){
    if (free) attack = AT_DSPECIAL_2;
    else move_cooldown[AT_DSPECIAL] = 2;
}

// change to batitless uspecial
if(attack == AT_USPECIAL && batitPlaced){
    attack = AT_USPECIAL_2;
}

// change to batitfull uspecial (this is reversed because batitless was made first)
if(attack == AT_FSPECIAL && !batitPlaced){
    attack = AT_FSPECIAL_2;
}

// nspecial batit projectile
if (attack == AT_NSPECIAL && batitPlaced && move_cooldown[AT_NSPECIAL] < 1){
    with batitArticle{
        if(state == 0){
            state = 9;
            state_timer = 0;
            other.move_cooldown[AT_NSPECIAL] = 300;
        } else other.move_cooldown[AT_NSPECIAL] = 2;
    }
}