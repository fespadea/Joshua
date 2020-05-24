var compatiblePlayer = 5;

with oPlayer {
    if(player != other.player && player < compatiblePlayer){
        if(url == 2006712792 || url == 1932454633) { // Feri and TCO respectively
            compatiblePlayer = player;
            other.compatibleUrl = url;
        }
    }
}

if(compatibleUrl == 2006712792){ //Feri taunt (big copy and paste from Feri)
    set_attack_value(AT_EXTRA_1, AG_SPRITE, sprite_get("taunt_tco"));
    set_attack_value(AT_EXTRA_1, AG_NUM_WINDOWS, 7);
    set_attack_value(AT_EXTRA_1, AG_OFF_LEDGE, 1);
    set_attack_value(AT_EXTRA_1, AG_HURTBOX_SPRITE, sprite_get("taunt_tco_hurt"));

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
} else if (compatibleUrl == 1932454633){
    set_attack_value(AT_EXTRA_1, AG_SPRITE, sprite_get("taunt_feri"));
    set_attack_value(AT_EXTRA_1, AG_NUM_WINDOWS, 7);
    set_attack_value(AT_EXTRA_1, AG_OFF_LEDGE, 1);
    set_attack_value(AT_EXTRA_1, AG_HURTBOX_SPRITE, sprite_get("taunt_feri_hurt"));

    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_LENGTH, 1);
    set_window_value(AT_EXTRA_1, 1, AG_WINDOW_ANIM_FRAMES, 1);

    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_LENGTH, 14);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_EXTRA_1, 2, AG_WINDOW_ANIM_FRAME_START, 1);

    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_LENGTH, 35);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_ANIM_FRAMES, 6);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_ANIM_FRAME_START, 3);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_SFX_FRAME, 1);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 3, AG_WINDOW_SFX, sound_get("pencilTCO"));

    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_LENGTH, 14);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_ANIM_FRAME_START, 9);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 4, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));

    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_LENGTH, 21);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_ANIM_FRAMES, 3);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_ANIM_FRAME_START, 10);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 5, AG_WINDOW_SFX, asset_get("sfx_blow_weak2"));

    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_LENGTH, 54);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_ANIM_FRAMES, 9);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_ANIM_FRAME_START, 13);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 6, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));

    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_TYPE, 1);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_LENGTH, 24);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_ANIM_FRAMES, 4);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_ANIM_FRAME_START, 22);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_EXTRA_1, 7, AG_WINDOW_SFX, asset_get("mfx_star"));

}