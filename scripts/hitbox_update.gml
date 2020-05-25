//hitbox update

if (attack == AT_UTILT && hbox_num == 2){
    if(vsp < 0){
        image_index = hitbox_timer/8 % 4;
    } else {
        image_index = hitbox_timer/8 % 2 + 4;
    }
} else if (attack == AT_DSPECIAL_AIR){
    switch(hbox_num){
        case 2:
        case 3:
            hbox_group = 3;
            break;
        case 1:
            if(!free){
                sound_play(sound_effect);
                spawn_hit_fx(x, y, hit_effect);
                create_hitbox(AT_DSPECIAL_AIR, 4, x, y);
                length = 0;
            }
        case 4:
            hbox_group = 4;
            break;
    }
} else if (attack == AT_NSPECIAL){
    if(hbox_num == 1){
        if(!free || was_parried) destroyed = true;
        if(hitbox_timer < length - 30)
            maxSpeed = ease_quadIn(5, 20, hitbox_timer, length - 30);
        if(targetPlayer != noone && instance_exists(targetPlayer)){
            angleToTarget = point_direction(x, y, targetPlayer.x, targetPlayer.y - targetPlayer.char_height/2);
            if(hitbox_timer < length - 30){
                if(hitbox_timer < (length-30)/2) percentAngle = ease_circIn(0, 1, hitbox_timer, (length - 30)/2);
                else percentAngle = ease_circIn(1, 0, hitbox_timer, length - 30);
                if(proj_angle > angleToTarget + 180) proj_angle -= 360;
                else if (angleToTarget > proj_angle + 180) proj_angle += 360;
                newAngle = lerp(proj_angle, angleToTarget, percentAngle*min(0.7, point_distance(x, y, targetPlayer.x, targetPlayer.y - targetPlayer.char_height/2)/100.0));
                if(newAngle > proj_angle + MAX_ANGLE_CHANGE){
                    newAngle = proj_angle + MAX_ANGLE_CHANGE;
                } else if (newAngle < proj_angle - MAX_ANGLE_CHANGE){
                    newAngle = proj_angle - MAX_ANGLE_CHANGE;
                }
                proj_angle = newAngle;
            }
        }
        hsp = maxSpeed*cos(degtorad(proj_angle));
        vsp = -maxSpeed*sin(degtorad(proj_angle));
        if(hitbox_timer % 8 == 0){
            spawn_hit_fx(x, y, leafFollowerVFX);
        }
    } else if (hbox_num == 2){
        player_id.move_cooldown[AT_NSPECIAL] = 2;
    }
} else if (attack == AT_FSTRONG && (hbox_num == 3 || hbox_num == 4)){
    hbox_group = 2;
}