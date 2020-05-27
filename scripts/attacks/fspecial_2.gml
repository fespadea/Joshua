set_attack_value(AT_FSPECIAL_2, AG_CATEGORY, 2);
set_attack_value(AT_FSPECIAL_2, AG_SPRITE, sprite_get("fspecial_2"));
set_attack_value(AT_FSPECIAL_2, AG_NUM_WINDOWS, 4);
set_attack_value(AT_FSPECIAL_2, AG_HURTBOX_SPRITE, sprite_get("fspecial_2_hurt"));

set_window_value(AT_FSPECIAL_2, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_FSPECIAL_2, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSPECIAL_2, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL_2, 1, AG_WINDOW_SFX, asset_get("sfx_rag_whip"));
set_window_value(AT_FSPECIAL_2, 1, AG_WINDOW_SFX_FRAME, 11);

set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_ANIM_FRAME_START, 3);

set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_LENGTH, 18);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_ANIM_FRAME_START, 6);

set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_HSPEED, 7);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_VSPEED, 0);

set_num_hitboxes(AT_FSPECIAL_2, 1);

set_hitbox_value(AT_FSPECIAL_2, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_WINDOW, 2);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_LIFETIME, 3);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_HITBOX_X, 77);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_HITBOX_Y, -29);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_WIDTH, 98);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_HEIGHT, 26);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_DAMAGE, 4);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_ANGLE, 170);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_HIT_SFX, asset_get("sfx_may_whip1"));