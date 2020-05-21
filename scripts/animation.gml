switch (state){
    case PS_WALL_JUMP:
        if(state_timer < 6){
            image_index = state_timer/3;
        } else {
            image_index = (state_timer-6)/13+2;
        }
        break;
}
if(unturn){
    spr_dir = prevSprDir;
    unturn = false;
} else prevSprDir = spr_dir;