var compatiblePlayer = 5;

with oPlayer {
    if(player != other.player && player < compatiblePlayer){
        if(url == 2006712792 || url == 1932454633 || url == 1933111975) { // Feri, TCO, and T&A respectively
            compatiblePlayer = player;
            other.compatibleUrl = url;
        }
    }
}

if(compatibleUrl == 2006712792){ //Feri taunt (big copy and paste from Feri)
    set_attack_value(AT_EXTRA_1, AG_SPRITE, sprite_get("taunt_feri"));
    set_attack_value(AT_EXTRA_1, AG_NUM_WINDOWS, 7);
    set_attack_value(AT_EXTRA_1, AG_OFF_LEDGE, 1);
    set_attack_value(AT_EXTRA_1, AG_HURTBOX_SPRITE, sprite_get("taunt_feri_hurt"));

    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_ANIM_FRAME_START, 0);
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_ANIM_FRAMES, 3);
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_LENGTH, 16);
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_SFX, asset_get("sfx_dream_star"));
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_SFX_FRAME, 1);

    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_ANIM_FRAME_START, 3);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_LENGTH, 14);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_SFX, asset_get("sfx_dream_cape"));
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_SFX_FRAME, 12);

    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_ANIM_FRAME_START, 5);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_ANIM_FRAMES, 1);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_LENGTH, 2);

    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_ANIM_FRAME_START, 6);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_LENGTH, 8);

    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_ANIM_FRAME_START, 8);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_ANIM_FRAMES, 1);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_LENGTH, 64);

    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_ANIM_FRAME_START, 9);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_LENGTH, 8);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_SFX, asset_get("sfx_clairen_arc_hit"));
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_SFX_FRAME, 1);

    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_ANIM_FRAME_START, 11);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_ANIM_FRAMES, 3);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_LENGTH, 12);
} else if (compatibleUrl == 1932454633){ //TCO taunt (big copy and paste from TCO)
    set_attack_value(AT_EXTRA_1, AG_SPRITE, sprite_get("taunt_tco"));
    set_attack_value(AT_EXTRA_1, AG_NUM_WINDOWS, 7);
    set_attack_value(AT_EXTRA_1, AG_OFF_LEDGE, 1);
    set_attack_value(AT_EXTRA_1, AG_HURTBOX_SPRITE, sprite_get("taunt_tco_hurt"));

    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_LENGTH, 1);
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_ANIM_FRAMES, 1);

    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_LENGTH, 14);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_ANIM_FRAME_START, 1);

    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_LENGTH, 35);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_ANIM_FRAMES, 7);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_ANIM_FRAME_START, 3);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_SFX_FRAME, 1);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_SFX, sound_get("pencilTCO"));

    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_LENGTH, 14);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_ANIM_FRAME_START, 10);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));

    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_LENGTH, 21);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_ANIM_FRAMES, 3);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_ANIM_FRAME_START, 12);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_SFX, asset_get("sfx_blow_weak2"));

    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_LENGTH, 54);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_ANIM_FRAMES, 6);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_ANIM_FRAME_START, 15);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));

    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_LENGTH, 24);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_ANIM_FRAMES, 4);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_ANIM_FRAME_START, 21);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_SFX, asset_get("sfx_rag_plant_eat"));

    set_num_hitboxes(AT_EXTRA_1, 1);
    
    set_hitbox_value(AT_EXTRA_1, 1, HG_HITBOX_TYPE, 2);
    set_hitbox_value(AT_EXTRA_1, 1, HG_WINDOW, 6);
    set_hitbox_value(AT_EXTRA_1, 1, HG_LIFETIME, 70);
    set_hitbox_value(AT_EXTRA_1, 1, HG_WINDOW_CREATION_FRAME, 9);
    set_hitbox_value(AT_EXTRA_1, 1, HG_HITBOX_X, -20);
    set_hitbox_value(AT_EXTRA_1, 1, HG_HITBOX_Y, -56);
    set_hitbox_value(AT_EXTRA_1, 1, HG_WIDTH, 1);
    set_hitbox_value(AT_EXTRA_1, 1, HG_HEIGHT, 1);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PRIORITY, 3);
    set_hitbox_value(AT_EXTRA_1, 1, HG_DAMAGE, 1);
    set_hitbox_value(AT_EXTRA_1, 1, HG_ANGLE, 15);
    set_hitbox_value(AT_EXTRA_1, 1, HG_BASE_KNOCKBACK, 3);
    set_hitbox_value(AT_EXTRA_1, 1, HG_KNOCKBACK_SCALING, 0.1);
    set_hitbox_value(AT_EXTRA_1, 1, HG_BASE_HITPAUSE, 3);
    set_hitbox_value(AT_EXTRA_1, 1, HG_HITPAUSE_SCALING, 0.5);
    set_hitbox_value(AT_EXTRA_1, 1, HG_HIT_SFX, asset_get("sfx_blow_weak1"));
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_SPRITE, sprite_get("taunt_tco_pencil"));
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_MASK, sprite_get("taunt_tco_pencil"));
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_ANIM_SPEED, 0.2);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_HSPEED, -1.2);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_VSPEED, -2.7);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_GROUND_FRICTION, 1);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_AIR_FRICTION, .009);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_GRAVITY, 0.3);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_WALL_BEHAVIOR, 2);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 2);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_IS_TRANSCENDENT, 1);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
    set_hitbox_value(AT_EXTRA_1, 1, HG_PROJECTILE_DESTROY_EFFECT, 15);
} else if(compatibleUrl = 1933111975){
    set_attack_value(AT_EXTRA_1, AG_SPRITE, sprite_get("taunt_trum_alto"));
    set_attack_value(AT_EXTRA_1, AG_NUM_WINDOWS, 2);
    set_attack_value(AT_EXTRA_1, AG_OFF_LEDGE, 1);
    set_attack_value(AT_EXTRA_1, AG_HURTBOX_SPRITE, sprite_get("taunt_trum_alto_hurt"));

    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_ANIM_FRAME_START, 0);
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_ANIM_FRAMES, 3);
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_LENGTH, 15);

    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_ANIM_FRAME_START, 3);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_ANIM_FRAMES, 1);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_LENGTH, 10);
}