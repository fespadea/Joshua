// update

// don't allow dspecial if batit is placed
if(batitPlaced){
    move_cooldown[AT_DSPECIAL] = 2;
} else if(batitDied){
    move_cooldown[AT_DSPECIAL] = 600;
    batitDied = false;
}