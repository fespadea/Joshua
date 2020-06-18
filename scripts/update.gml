// update

// don't allow dspecial/fstrong if batit is placed
if(batitPlaced){
    batitDelay = 2;
    // Batit move detection
    switch(state_cat){
        case SC_HITSTUN:
        case SC_AIR_COMMITTED:
        case SC_GROUND_COMMITTED:
            switch(state){
                case PS_WALL_JUMP:
                case PS_RESPAWN:
                case PS_WALK_TURN:
                case PS_DASH_START:
                case PS_DASH:
                case PS_DASH_TURN:
                case PS_DASH_STOP:
                    break;
                default:
                    if(state_timer == 0){
                        clear_button_buffer(PC_ATTACK_PRESSED);
                        clear_button_buffer(PC_LEFT_STICK_PRESSED);
                        clear_button_buffer(PC_RIGHT_STICK_PRESSED);
                        clear_button_buffer(PC_UP_STICK_PRESSED);
                        clear_button_buffer(PC_DOWN_STICK_PRESSED);
                        clear_button_buffer(PC_STRONG_PRESSED);
                        clear_button_buffer(PC_LEFT_STRONG_PRESSED);
                        clear_button_buffer(PC_RIGHT_STRONG_PRESSED);
                        clear_button_buffer(PC_UP_STRONG_PRESSED);
                        clear_button_buffer(PC_DOWN_STRONG_PRESSED);
                        clear_button_buffer(PC_SHIELD_PRESSED);
                        clear_button_buffer(PC_SPECIAL_PRESSED);
                    }
                    if(batitArticle.state == 0 || batitArticle.state == 3){
                        if(up_strong_pressed){
                            batitAttack(11, 1); // the direction doesn't matter here
                        } else if(right_strong_pressed){
                            var tempAttack = attack;
                            attack = AT_FSTRONG
                            attack_end();
                            attack = tempAttack;
                            batitAttack(10, 1);
                        } else if(left_strong_pressed){
                            var tempAttack = attack;
                            attack = AT_FSTRONG;
                            attack_end();
                            attack = tempAttack;
                            batitAttack(10, -1);
                        } else if((attack_pressed && right_down) || right_stick_pressed){
                            batitAttack(1, 1);
                        } else if((attack_pressed && left_down) || left_stick_pressed){
                            batitAttack(1, -1);
                        } else if((attack_pressed && up_down) || up_stick_pressed){
                            batitAttack(7, 1); // the direction doesn't matter here
                        } else if(special_pressed || is_special_pressed(DIR_ANY)){
                            if (move_cooldown[AT_NSPECIAL] < 1){
                                with batitArticle{
                                    switch(state){
                                        case 3:
                                            if(bumpBox != noone){
                                                bumpBox.length = 0;
                                                bumpBox = noone;
                                            }
                                        case 0:
                                            state = 9;
                                            state_timer = 0;
                                            other.move_cooldown[AT_NSPECIAL] = other.BATIT_NSPECIAL_COOLDOWN;
                                            break;
                                    }
                                }
                            }
                        }
                    }
            }
    }
} else if(batitDied){
    batitDelay = 600;
    batitDied = false;
    batitFell = false;
} else if(batitFell){
    batitDelay = 300;
    batitFell = false;
}
// stat switching
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
    //reset uspecial values
    reset_hitbox_value(AT_USPECIAL, 13, HG_KNOCKBACK_SCALING);
    reset_hitbox_value(AT_USPECIAL, 13, HG_HITPAUSE_SCALING);
    reset_window_value(AT_USPECIAL, 4, AG_WINDOW_TYPE);
    reset_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED);
}
batitDelay--;

//prevent bombs from being used if unwanted
if(!free || state_cat == SC_HITSTUN){
    noMoreBombs = false;
} else if(noMoreBombs){
    move_cooldown[AT_DSPECIAL_AIR] = 2;
}

//toggle optional system to avoid triggering Batit with tilts and strongs
if(attack_down && taunt_down){
    if(canSwitchProjectiles){
        projectilesMandatory = !projectilesMandatory;
        canSwitchProjectiles = false;
    }
} else {
    canSwitchProjectiles = true;
}
if(strong_down && taunt_down){
    if(canSwitchStrongs){
        strongsMandatory = !strongsMandatory;
        canSwitchStrongs = false;
    }
} else {
    canSwitchStrongs = true;
}
// toggle auto nudge
if(shield_down && taunt_down){
    if(canSwitchNudge){
        autoNudge = !autoNudge;
        canSwitchNudge = false;
    }
} else {
    canSwitchNudge = true;
}

//reset pickup batit variable
if(pickUpBatit && !((state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) && attack == AT_FSPECIAL)){
    pickUpBatit = false;
}

//new parry sound
if(state == PS_PARRY){
    if(state_timer == 1){
        sound_play(newParrySound);
    }
}

// command grab (template)
if(grabbedid != noone && !((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) && attack == AT_FSPECIAL)){
    if(instance_exists(grabbedid)){
        grabbedid.ungrab++;
        if(grabbedid.ungrab == 2){
            grabbedid.state = PS_TUMBLE;
            grabbedid.ungrab = 0;
            grabbedid = noone;
        }
    } else {
        grabbedid = noone;
    }
}

// intro (template)
if (introTimer2 < 4) {
    introTimer2++;
} else {
    introTimer2 = 0;
    introTimer++;
}
#macro COUNTDOWN_LENGTH 122
if (get_gameplay_time() < COUNTDOWN_LENGTH) {
    if(shield_pressed){
        var curRealAlt = sprite_get_xoffset(sprite_get("dog"));
        curRealAlt += 16;
        if(curRealAlt >= NUM_ALTS){
            curRealAlt -= NUM_ALTS;
        }
        clear_button_buffer(PC_SHIELD_PRESSED);
        sprite_change_offset("dog", curRealAlt, sprite_get_yoffset(sprite_get("dog")));
        init_shader();
    }
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

// trummel and alto support
if trummelcodecneeded{
    trummelcodec = 17;
    trummelcodecmax = 15;
    trummelcodecsprite1 = sprite_get("joshua_codec");
    trummelcodecsprite2 = sprite_get("batit_codec");
    var page = 0;

    //Page 0
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 1;

    trummelcodecline[page,1] = "Hey Trummel look,";
    trummelcodecline[page,2] = "another duo we got here.";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 1
    trummelcodecspeaker[page] = 2;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "prepare for trouble";
    trummelcodecline[page,2] = "";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 2
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "Haven't seen this guy";
    trummelcodecline[page,2] = "before, lemme check out";
    trummelcodecline[page,3] = "my Steam.";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 3
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "...";
    trummelcodecline[page,2] = "";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 4
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 2;

    trummelcodecline[page,1] = "Why do we have 2";
    trummelcodecline[page,2] = "Joshuas?";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 5
    trummelcodecspeaker[page] = 3;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "First one is Rayman";
    trummelcodecline[page,2] = "handed me, very little";
    trummelcodecline[page,3] = "inclusion of Batit at all.";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 6
    trummelcodecspeaker[page] = 3;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "The high quality one is";
    trummelcodecline[page,2] = "me.";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 7
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 2;

    trummelcodecline[page,1] = "Neat! So Batit is your";
    trummelcodecline[page,2] = "down special?";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 8
    trummelcodecspeaker[page] = 3;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "Yes";
    trummelcodecline[page,2] = "";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 9
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "Apparently when he does";
    trummelcodecline[page,2] = "not have Batit, he can't";
    trummelcodecline[page,3] = "use some of his moves,";
    trummelcodecline[page,4] = "mainly his strongs.";
    page++; 

    //Page 10
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 3;

    trummelcodecline[page,1] = "We should kick that plant";
    trummelcodecline[page,2] = "offstage Trum.";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 11
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "plants have feelings too.";
    trummelcodecline[page,2] = "";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 12
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 5;

    trummelcodecline[page,1] = "Wait, wait wait wait...";
    trummelcodecline[page,2] = "you can talk?";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 13
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "rivals dont make sense";
    trummelcodecline[page,2] = "dummy.";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 14
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 4;

    trummelcodecline[page,1] = "I'm no dummy.";
    trummelcodecline[page,2] = "";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 

    //Page 15
    trummelcodecspeaker[page] = 2;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "you are dumi";
    trummelcodecline[page,2] = "";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 
}

#define batitAttack(newState, newDir)
with batitArticle {
    switch(state){
        case 3:
            if(bumpBox != noone){
                bumpBox.length = 0;
                bumpBox = noone;
            }
        case 0:
            attackDir = newDir;
            state = newState;
            state_timer = 0;
        break;
    }
}