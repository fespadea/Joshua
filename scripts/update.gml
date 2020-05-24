// update

// don't allow dspecial/fstrong if batit is placed
if(batitPlaced){
    batitDelay = 2;
} else if(batitDied){
    batitDelay = 600;
    batitDied = false;
    batitFell = false;
} else if(batitFell){
    batitDelay = 300;
    batitFell = false;
}
if(batitDelay > 0){
    move_cooldown[AT_TAUNT] = 2;
    if(batitStats){
        walk_speed += .25;
        walk_accel += .05;
        initial_dash_speed += .5;
        dash_speed += .5;
        jump_speed += .5;
        short_hop_speed += .5;
        djump_speed += .5;
        leave_ground_max += .5;
        max_jump_hsp += .5;
        air_max_speed += .5;
        jump_change += .5;
        air_accel += .05;
        walljump_hsp += .5;
        walljump_vsp += .5;
        batitStats = false;
    }
} else {
    if(!batitStats){
        walk_speed -= .25;
        walk_accel -= .05;
        initial_dash_speed -= .5;
        dash_speed -= .5;
        jump_speed -= .5;
        short_hop_speed -= .5;
        djump_speed -= .5;
        leave_ground_max -= .5;
        max_jump_hsp -= .5;
        air_max_speed -= .5;
        jump_change -= .5;
        air_accel -= .05;
        walljump_hsp -= .5;
        walljump_vsp -= .5;
        batitStats = true;
    }
}
batitDelay--;

//new parry sound
if(state == PS_PARRY){
    sound_stop(asset_get("sfx_parry_use"));
    if(state_timer == 1) sound_play(sound_get("JoshuaParryUse"));
}

// reset air_accel
if(air_accel != tempAirAccel && !(state == PS_ATTACK_AIR && attack == AT_FSPECIAL_2)){
    air_accel = tempAirAccel;
}

//kirby support
if swallowed {
    swallowed = 0
    var ability_spr = sprite_get("kirby_nspecial_joshua");
    var ability_hurt = sprite_get("kirby_nspecial_joshua");
    var ability_icon = sprite_get("kirby_nspecial_icon");
    with enemykirby {
        set_attack_value(AT_EXTRA_3, AG_CATEGORY, 2);
        set_attack_value(AT_EXTRA_3, AG_SPRITE, ability_spr);
        set_attack_value(AT_EXTRA_3, AG_NUM_WINDOWS, 4);
        set_attack_value(AT_EXTRA_3, AG_STRONG_CHARGE_WINDOW, 1);
        set_attack_value(AT_EXTRA_3, AG_HURTBOX_SPRITE, ability_hurt);

        set_window_value(AT_EXTRA_3, 1, AG_WINDOW_LENGTH, 12);
        set_window_value(AT_EXTRA_3, 1, AG_WINDOW_ANIM_FRAMES, 2);

        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_LENGTH, 3);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAMES, 1);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAME_START, 2);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_HAS_SFX, 1);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_SFX, asset_get("sfx_swipe_heavy1"));
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_SFX_FRAME, 2);

        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_LENGTH, 3);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAMES, 1);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAME_START, 3);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_HSPEED, 5);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_HSPEED_TYPE, 2);

        set_window_value(AT_EXTRA_3, 4, AG_WINDOW_LENGTH, 18);
        set_window_value(AT_EXTRA_3, 4, AG_WINDOW_ANIM_FRAMES, 2);
        set_window_value(AT_EXTRA_3, 4, AG_WINDOW_ANIM_FRAME_START, 4);
        set_window_value(AT_EXTRA_3, 4, AG_WINDOW_HAS_WHIFFLAG, 1);

        set_num_hitboxes(AT_EXTRA_3, 2);

        set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_TYPE, 1);
        set_hitbox_value(AT_EXTRA_3, 1, HG_WINDOW, 3);
        set_hitbox_value(AT_EXTRA_3, 1, HG_LIFETIME, 3);
        set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_X, 70);
        set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_Y, -26);
        set_hitbox_value(AT_EXTRA_3, 1, HG_WIDTH, 93);
        set_hitbox_value(AT_EXTRA_3, 1, HG_HEIGHT, 46);
        set_hitbox_value(AT_EXTRA_3, 1, HG_PRIORITY, 2);
        set_hitbox_value(AT_EXTRA_3, 1, HG_DAMAGE, 4);
        set_hitbox_value(AT_EXTRA_3, 1, HG_ANGLE, 45);
        set_hitbox_value(AT_EXTRA_3, 1, HG_BASE_KNOCKBACK, 4);
        set_hitbox_value(AT_EXTRA_3, 1, HG_KNOCKBACK_SCALING, .6);
        set_hitbox_value(AT_EXTRA_3, 1, HG_BASE_HITPAUSE, 4);
        set_hitbox_value(AT_EXTRA_3, 1, HG_HITPAUSE_SCALING, .6);
        set_hitbox_value(AT_EXTRA_3, 1, HG_VISUAL_EFFECT, 198);
        set_hitbox_value(AT_EXTRA_3, 1, HG_HIT_SFX, asset_get("sfx_may_whip1"));
        set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_GROUP, 1);

        set_hitbox_value(AT_EXTRA_3, 2, HG_HITBOX_TYPE, 1);
        set_hitbox_value(AT_EXTRA_3, 2, HG_WINDOW, 3);
        set_hitbox_value(AT_EXTRA_3, 2, HG_LIFETIME, 3);
        set_hitbox_value(AT_EXTRA_3, 2, HG_HITBOX_X, 125);
        set_hitbox_value(AT_EXTRA_3, 2, HG_HITBOX_Y, -26);
        set_hitbox_value(AT_EXTRA_3, 2, HG_WIDTH, 31);
        set_hitbox_value(AT_EXTRA_3, 2, HG_HEIGHT, 29);
        set_hitbox_value(AT_EXTRA_3, 2, HG_PRIORITY, 3);
        set_hitbox_value(AT_EXTRA_3, 2, HG_DAMAGE, 7);
        set_hitbox_value(AT_EXTRA_3, 2, HG_ANGLE, 35);
        set_hitbox_value(AT_EXTRA_3, 2, HG_BASE_KNOCKBACK, 6);
        set_hitbox_value(AT_EXTRA_3, 2, HG_KNOCKBACK_SCALING, .8);
        set_hitbox_value(AT_EXTRA_3, 2, HG_BASE_HITPAUSE, 6);
        set_hitbox_value(AT_EXTRA_3, 2, HG_HITPAUSE_SCALING, .8);
        set_hitbox_value(AT_EXTRA_3, 2, HG_VISUAL_EFFECT, 159);
        set_hitbox_value(AT_EXTRA_3, 2, HG_HIT_SFX, asset_get("sfx_may_whip2"));
        set_hitbox_value(AT_EXTRA_3, 2, HG_HITBOX_GROUP, 1);

        newicon = ability_icon;
    }
}