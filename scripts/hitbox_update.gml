//hitbox update

if(attack == AT_FTILT && hbox_num == 1){
    vsp = ease_expoIn(0, -3, hitbox_timer, 60);
} else if (attack == AT_UTILT && hbox_num == 2){
    if(vsp < 0){
        image_index = hitbox_timer/8 % 4;
    } else {
        image_index = hitbox_timer/8 % 2 + 4;
    }
} else if (attack == AT_DSPECIAL_2 && hbox_num == 1){
    if(!free){
        sound_play(sound_effect);
        spawn_hit_fx(x, y, hit_effect);
        length = 0;
    }
}