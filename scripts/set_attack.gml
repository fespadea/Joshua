// set attack

// set up Dattack variable
if(attack == AT_DATTACK) finishDattack = false;

// change to batitless dspecial
if(attack == AT_DSPECIAL && batitDelay > 0){
    if (free) attack = AT_DSPECIAL_2;
    else move_cooldown[AT_DSPECIAL] = 2;
}