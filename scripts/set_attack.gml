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