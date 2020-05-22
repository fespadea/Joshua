switch (state){
    case PS_WALL_JUMP:
        if(state_timer < 6){
            image_index = state_timer/3;
        } else {
            image_index = (state_timer-6)/13+2;
        }
        break;
    case PS_ATTACK_GROUND:
        if(attack == AT_DSPECIAL_2 && window == 1){
            if (strong_charge % 10 >= 5){
                sprite_index = dspecial2ChargeSprite;
            } else if(strong_charge % 10 >= 0){
                sprite_index = dspecial2Sprite;
            }
        }
}
if(unturn){
    spr_dir = prevSprDir;
    unturn = false;
} else prevSprDir = spr_dir;