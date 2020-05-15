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
} else if (attack == AT_NSPECIAL && hbox_num == 1){
    if(!free || was_parried) destroyed = true;
    if(hitbox_timer < length - 30)
        maxSpeed = ease_quadIn(5, 20, hitbox_timer, length - 30);
    if(targetPlayer != noone){
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
}