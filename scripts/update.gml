// update

// don't allow dspecial/fstrong if batit is placed
if(batitPlaced){
    if(runeM){
        if(batitDied){
            if(!runeH){
                batitDelay = 600;
            }
            batitDied = false;
            batitFell = false;
        } else if(batitFell){
            if(!runeH){
                batitDelay = 300;
            }
            batitFell = false;
        }
    }
    if(!runeM || array_length(batitArticle) >= 2){
        batitDelay = 2;
    }
    // Batit move detection
    switch(state_cat){
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
                    if(runeM){
                        var batitCanAttack = false;
                        for(var i = 0; i < array_length(batitArticle); i++){
                            if(batitArticle[i].state == 0 || batitArticle[i].state == 3 || (runeN && (batitArticle[i].state == 1 || batitArticle[i].state == 7 || batitArticle[i].state == 9 || batitArticle[i].state == 10 || batitArticle[i].state == 11))){
                                batitCanAttack = true;
                            }
                        }
                    } else {
                        var batitCanAttack = batitArticle.state == 0 || batitArticle.state == 3 || (runeN && (batitArticle.state == 1 || batitArticle.state == 7 || batitArticle.state == 9 || batitArticle.state == 10 || batitArticle.state == 11));
                    }
                    if(batitCanAttack){
                        if(up_strong_pressed){
                            batitAttack(11, 1); // the direction doesn't matter here
                        } else if(right_strong_pressed){
                            attack_end(AT_FSTRONG);
                            batitAttack(10, 1);
                        } else if(left_strong_pressed){
                            attack_end(AT_FSTRONG);
                            batitAttack(10, -1);
                        } else if((attack_pressed && right_down) || right_stick_pressed){
                            batitAttack(1, 1);
                        } else if((attack_pressed && left_down) || left_stick_pressed){
                            batitAttack(1, -1);
                        } else if((attack_pressed && up_down) || up_stick_pressed){
                            batitAttack(7, 1); // the direction doesn't matter here
                        } else if(special_pressed || is_special_pressed(DIR_ANY)){
                            if (move_cooldown[AT_NSPECIAL] < 1 || runeE){
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
                                        case 1:
                                        case 7:
                                        case 9:
                                        case 10:
                                        case 11:
                                            if(other.runeN){
                                                state = 9;
                                                other.move_cooldown[AT_NSPECIAL] = other.BATIT_NSPECIAL_COOLDOWN;
                                                state_timer = 0;
                                            }
                                            break;
                                    }
                                }
                            }
                            if(runeN){
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
                        }
                    }
            }
    }
} else if(batitDied){
    if(!runeH){
        batitDelay = 600;
    }
    batitDied = false;
    batitFell = false;
} else if(batitFell){
    if(!runeH){
        batitDelay = 300;
    }
    batitFell = false;
}
// stat switching
if(batitDelay > 0 || runeD){
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
if(batitDelay <= 0 && !runeJ){
    //reset uspecial values
    reset_hitbox_value(AT_USPECIAL, 13, HG_KNOCKBACK_SCALING);
    reset_hitbox_value(AT_USPECIAL, 13, HG_HITPAUSE_SCALING);
    reset_window_value(AT_USPECIAL, 4, AG_WINDOW_TYPE);
    reset_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED);
}
batitDelay--;

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
        if(grabbedid.ungrab >= 2){
            if(grabbedid.state == PS_WRAPPED)
                grabbedid.state = PS_TUMBLE;
            grabbedid.ungrab = 0;
            grabbedid = noone;
        }
    } else {
        grabbedid = noone;
    }
}

// runes
if(runesUpdated || runesEnabled){
    runesEnabled = false;
    if(runeI){
        set_hitbox_value(AT_USTRONG, 2, HG_EXTRA_HITPAUSE, 20);
        set_hitbox_value(AT_FSTRONG, 3, HG_EXTRA_HITPAUSE, 20);
        set_hitbox_value(AT_FSTRONG, 4, HG_EXTRA_HITPAUSE, 20);
    } else{
        reset_hitbox_value(AT_USTRONG, 2, HG_EXTRA_HITPAUSE);
        reset_hitbox_value(AT_FSTRONG, 3, HG_EXTRA_HITPAUSE);
        reset_hitbox_value(AT_FSTRONG, 4, HG_EXTRA_HITPAUSE);
    }
    if(runeK){
        set_hitbox_value(AT_NSPECIAL, 2, HG_HITSTUN_MULTIPLIER, 6);
    } else {
        reset_hitbox_value(AT_NSPECIAL, 2, HG_HITSTUN_MULTIPLIER);
    }
    if(runeL){
        set_hitbox_value(AT_DSPECIAL_AIR, 1, HG_DAMAGE, 8);
        set_hitbox_value(AT_DSPECIAL_AIR, 1, HG_BASE_KNOCKBACK, 9);
        set_hitbox_value(AT_DSPECIAL_AIR, 1, HG_VISUAL_EFFECT, 143);
        set_hitbox_value(AT_DSPECIAL_AIR, 4, HG_WIDTH, 150);
        set_hitbox_value(AT_DSPECIAL_AIR, 4, HG_HEIGHT, 150);
        set_hitbox_value(AT_DSPECIAL_AIR, 4, HG_DAMAGE, 4);
        set_hitbox_value(AT_DSPECIAL_AIR, 4, HG_LIFETIME, 18);
        set_hitbox_value(AT_DSPECIAL_AIR, 4, HG_BASE_KNOCKBACK, 7);
        set_window_value(AT_DSPECIAL_AIR, 1, AG_WINDOW_LENGTH, 8);
    } else {
        reset_hitbox_value(AT_DSPECIAL_AIR, 1, HG_DAMAGE);
        reset_hitbox_value(AT_DSPECIAL_AIR, 1, HG_BASE_KNOCKBACK);
        reset_hitbox_value(AT_DSPECIAL_AIR, 1, HG_VISUAL_EFFECT);
        reset_hitbox_value(AT_DSPECIAL_AIR, 4, HG_WIDTH);
        reset_hitbox_value(AT_DSPECIAL_AIR, 4, HG_HEIGHT);
        reset_hitbox_value(AT_DSPECIAL_AIR, 4, HG_DAMAGE);
        reset_hitbox_value(AT_DSPECIAL_AIR, 4, HG_LIFETIME);
        reset_hitbox_value(AT_DSPECIAL_AIR, 4, HG_BASE_KNOCKBACK);
        reset_window_value(AT_DSPECIAL_AIR, 1, AG_WINDOW_LENGTH);
    }
    if(runeJ){
        set_hitbox_value(AT_USPECIAL, 13, HG_KNOCKBACK_SCALING, .5);
        set_hitbox_value(AT_USPECIAL, 13, HG_HITPAUSE_SCALING, .4);
        set_window_value(AT_USPECIAL, 4, AG_WINDOW_TYPE, 0);
        set_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED, -10);
    } else {
        reset_hitbox_value(AT_USPECIAL, 13, HG_KNOCKBACK_SCALING);
        reset_hitbox_value(AT_USPECIAL, 13, HG_HITPAUSE_SCALING);
        reset_window_value(AT_USPECIAL, 4, AG_WINDOW_TYPE);
        reset_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED);
    }
    if(runeF){
        set_hitbox_value(AT_UAIR, 1, HG_PRIORITY, 0);
        set_hitbox_value(AT_UAIR, 2, HG_HITBOX_X, 15);
        set_hitbox_value(AT_UAIR, 2, HG_HITBOX_Y, -40);
        set_hitbox_value(AT_UAIR, 2, HG_WIDTH, 60);
        set_hitbox_value(AT_UAIR, 2, HG_HEIGHT, 60);
        set_hitbox_value(AT_UAIR, 3, HG_HITBOX_X, 15);
        set_hitbox_value(AT_UAIR, 3, HG_HITBOX_Y, -40);
        set_hitbox_value(AT_UAIR, 3, HG_WIDTH, 60);
        set_hitbox_value(AT_UAIR, 3, HG_HEIGHT, 60);
        set_hitbox_value(AT_UAIR, 4, HG_HITBOX_X, 15);
        set_hitbox_value(AT_UAIR, 4, HG_HITBOX_Y, -40);
        set_hitbox_value(AT_UAIR, 4, HG_WIDTH, 60);
        set_hitbox_value(AT_UAIR, 4, HG_HEIGHT, 60);
        set_hitbox_value(AT_UAIR, 5, HG_HITBOX_X, 15);
        set_hitbox_value(AT_UAIR, 5, HG_HITBOX_Y, -40);
        set_hitbox_value(AT_UAIR, 5, HG_WIDTH, 60);
        set_hitbox_value(AT_UAIR, 5, HG_HEIGHT, 60);
    } else {
        reset_hitbox_value(AT_UAIR, 1, HG_PRIORITY);
        reset_hitbox_value(AT_UAIR, 2, HG_HITBOX_X);
        reset_hitbox_value(AT_UAIR, 2, HG_HITBOX_Y);
        reset_hitbox_value(AT_UAIR, 2, HG_WIDTH);
        reset_hitbox_value(AT_UAIR, 2, HG_HEIGHT);
        reset_hitbox_value(AT_UAIR, 3, HG_HITBOX_X);
        reset_hitbox_value(AT_UAIR, 3, HG_HITBOX_Y);
        reset_hitbox_value(AT_UAIR, 3, HG_WIDTH);
        reset_hitbox_value(AT_UAIR, 3, HG_HEIGHT);
        reset_hitbox_value(AT_UAIR, 4, HG_HITBOX_X);
        reset_hitbox_value(AT_UAIR, 4, HG_HITBOX_Y);
        reset_hitbox_value(AT_UAIR, 4, HG_WIDTH);
        reset_hitbox_value(AT_UAIR, 4, HG_HEIGHT);
        reset_hitbox_value(AT_UAIR, 5, HG_HITBOX_X);
        reset_hitbox_value(AT_UAIR, 5, HG_HITBOX_Y);
        reset_hitbox_value(AT_UAIR, 5, HG_WIDTH);
        reset_hitbox_value(AT_UAIR, 5, HG_HEIGHT);
    }
}

// uair command grab (template)
if(!(state == PS_ATTACK_AIR && attack == AT_UAIR)){
    for(var k = 0; k < array_length(uairGrabbedid); k++){
        if(uairGrabbedid[k,0] != noone && instance_exists(uairGrabbedid[k,0])){
            uairGrabbedid[k,0].ungrab++;
            if(uairGrabbedid[k,0].ungrab >= 2){
                uairGrabbedid[k,0].ungrab = 0;
                uairGrabbedid[k,0] = noone;
                uairGrabbedid[k,1] = 0;
                uairGrabbedid[k,2] = 0;
            }
        } else {
            uairGrabbedid[k,0] = noone;
            uairGrabbedid[k,1] = 0;
            uairGrabbedid[k,2] = 0;
        }
    }
}

// intro (template)
if (introTimer2 < 4) {
    introTimer2++;
} else {
    introTimer2 = 0;
    introTimer++;
}

// alt changing
#macro CHANGE_ALT_FRAME_LIMIT 100
if (get_gameplay_time() < CHANGE_ALT_FRAME_LIMIT) {
    if(special_pressed){
        var curRealAlt = sprite_get_xoffset(sprite_get("dog"));
        curRealAlt += 16;
        if(curRealAlt >= NUM_ALTS){
            curRealAlt = curRealAlt % 16;
        }
        clear_button_buffer(PC_SPECIAL_PRESSED);
        sprite_change_offset("dog", curRealAlt, sprite_get_yoffset(sprite_get("dog")));
        init_shader();
    } else if(jump_pressed){
        var curRealAlt = sprite_get_xoffset(sprite_get("dog"));
        curRealAlt -= 16;
        if(curRealAlt < 0){
            while(curRealAlt+16 < NUM_ALTS){ // could not think of better math cause dumb
                curRealAlt += 16;
            }
        }
        clear_button_buffer(PC_JUMP_PRESSED);
        sprite_change_offset("dog", curRealAlt, sprite_get_yoffset(sprite_get("dog")));
        init_shader();
    }
}

//mark recent hit on a player article
has_hit_player_article_still_new_attack_update_gml = has_hit_player_article;
has_hit_player_article_still_new_update_gml = has_hit_player_article;
has_hit_player_article = false;

//runeC support for player articles
if(has_hit_player_article_still_new_update_gml){
    has_hit_player_article_still_new_update_gml = false;
    // random alt rune
    if(runeC){
        sprite_change_offset("dog", random_func(10, NUM_ALTS, true), sprite_get_yoffset(sprite_get("dog")));
        init_shader();
    }
}

//rainbow alt
if(sprite_get_xoffset(sprite_get("dog")) == 32){
    init_shader();
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

if(get_gameplay_time() == 2 || wasReloaded){ // runs at the beginning of the match or after reloading the character
    wasReloaded = false; // this makes it so that it only runs once after reloading the character

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

    
    practiceMode = get_training_cpu_action() != CPU_FIGHT && object_index != oTestPlayer;
    if(practiceMode){
        //tutorial
        currentTutorialPage = 0;
        var pageNum = 0;
        tutorialPages[pageNum++] = "Taunt for tutorial.";
        tutorialPages[pageNum++] = "In practice mode only, taunt can be cancelled for the sake of this tutorial. You can go back a page with left + taunt and right 10 pages with right + taunt.";
        tutorialPages[pageNum++] = "Joshua's main gimmick is his plant Batit which can be placed with dspecial.";
        tutorialPages[pageNum++] = "Batit has 50 health, and has a 10 second cooldown before he can be placed again if he dies. He also has a 5 second cooldown if he falls offstage.";
        tutorialPages[pageNum++] = "When placed, Joshua's specials change, and he also loses his fstrong and ustrong.";
        tutorialPages[pageNum++] = "Most of Joshua's moves are pretty self-explanatory, so just figure them out yourself. This tutorial will cover more obscure things.";
        tutorialPages[pageNum++] = "Let's cover how to control Batit first.";
        tutorialPages[pageNum++] = "Batit has 3 main projectiles: nspecial (2.5 second cooldown), fattack (side + attack), and uattack (up + attack). He also has 2 strongs: fstrong and ustrong.";
        tutorialPages[pageNum++] = "These moves can be used at any time, almost entirely desynced from Joshua.";
        tutorialPages[pageNum++] = "In order to use fair, uair, bair, ftilt, utilt, fstrong, or ustrong without triggering Batit's attacks or strongs, you have to quickly tap the input.";
        tutorialPages[pageNum++] = "You have until frame 6 of the move to let go of the input before Batit starts his attack or strong.";
        tutorialPages[pageNum++] = "This does mean that Batit will have 6 frames of extra start up in these situations.";
        tutorialPages[pageNum++] = "If you're fast, you can just repress the inputs immediately to make Batit attack sooner.";
        tutorialPages[pageNum++] = "However, you also have the option to toggle this option, so that Batit always attacks with you (assuming he's able to).";
        tutorialPages[pageNum++] = "This is done by pressing taunt+attack for the attacks and taunt + strong for the strongs at any point during a match.";
        tutorialPages[pageNum++] = "These two toggles are independent of each other, and their status is indicated by the top two lights on the HUD (attack is top and strong is middle).";
        tutorialPages[pageNum++] = "Next, I'll go over some specific interactions that Joshua's moves can have with Batit.";
        tutorialPages[pageNum++] = "The most simple is that fspecial picks up Batit. It also functions as a grab (this takes priority over picking up Batit).";
        tutorialPages[pageNum++] = "Next is uspecial. When Joshua is using uspecial and touching Batit, he can press special (or up-special with special stick) to transition into his Batitful uspecial.";
        tutorialPages[pageNum++] = "This version of uspecial starts in window 3 (the window where you go up), goes higher, has better knockback scaling on the final hit, and does not end in pratfall.";
        tutorialPages[pageNum++] = "If you have Batit with you, you can also drop him midair to use this move for recovery if necessary. You'll be dropping Batit Yoshi-style though.";
        tutorialPages[pageNum++] = "The last move is batitless dspecial. Joshua can throw a bomb into Batit for a very good kill move, but be careful as this kills Batit.";
        tutorialPages[pageNum++] = "The explosion can be delayed by up to 90 frames by holding special, but delaying the explosion decreases its strength by up to 50% at the max delay (for damage, base knockback, and knockback scaling).";
        tutorialPages[pageNum++] = "Also, Batit can be healed with Taunt.";
        tutorialPages[pageNum++] = "Finally, I want to go over nudging. If Joshua attacks Batit (excluding batitless dspecial and fspecial for obvious reasons), Batit will get nudged.";
        tutorialPages[pageNum++] = "This will put Batit in a state where he is sent flying in a the direction of the hitbox's knockback angle (some hitboxes have adjusted knockback).";
        tutorialPages[pageNum++] = "In this state, Batit cannot be damage, and he is surrounded by a hitbox that inherits the properties of the hitbox that hit it.";
        tutorialPages[pageNum++] = "Nudge can also be cancelled into any of Batit's attacks, but he loses his invincibility and hitbox.";
        tutorialPages[pageNum++] = "In order to not nudge Batit, Joshua has to hold shield during his attack.";
        tutorialPages[pageNum++] = "Nudging can be toggled to not be default, so that you have to hold shield during attacks to nudge Batit by pressing taunt+shield anytime during a match.";
        tutorialPages[pageNum++] = "The state of this toggle is indicated by the bottom light on the HUD.";
        tutorialPages[pageNum++] = "One last thing regarding the extra alts on the CSS. They can't be selected online, so you can press special during the countdown to change to the alt on the next row or jump to go the other way (this loops). That's all probably.";
        totalTutorialPages = array_length(tutorialPages) - 1;
        //tutorial sprites
        tutorialSingleSprite = sprite_get("tutorial_single_line");
        TUTORIAL_SINGLE_SPRITE_HEIGHT = sprite_get_height(tutorialSingleSprite);
        tutorialBottomSprite = sprite_get("tutorial_bottom_line");
        TUTORIAL_BOTTOM_SPRITE_HEIGHT = sprite_get_height(tutorialBottomSprite);
        tutorialTopSprite = sprite_get("tutorial_top_line");
        TUTORIAL_TOP_SPRITE_HEIGHT = sprite_get_height(tutorialTopSprite);
        tutorialMiddleSprite = sprite_get("tutorial_middle_line");
        TUTORIAL_MIDDLE_SPRITE_HEIGHT = sprite_get_height(tutorialMiddleSprite);
        TEXT_HEIGHT = string_height("0123456789/");
        // string parsing
        // the width of the line where the text is written on in pixels minus 2 (this can't be indented since it's a macro)
#macro MAX_LINE_LENGTH 210
        var page;
        var i;
        var word;
        var line;
        for(var j = array_length(tutorialPages)-1; j >= 0; j--){
            page = tutorialPages[j];
            i = 0;
            word = "";
            while(string_length(page) > 0 || string_length(word) > 0){
                line = "";
                word = string_copy(word, 2, string_length(word)-1);
                while(string_width(line + word) <= MAX_LINE_LENGTH){
                    line += word;
                    word = "";
                    if(string_length(page) == 0){
                        break;
                    }
                    word += string_char_at(page, 1);
                    page = string_copy(page, 2, string_length(page)-1);
                    while(string_char_at(page, 1) != " " && string_length(page) > 0){
                        word += string_char_at(page, 1);
                        page = string_copy(page, 2, string_length(page)-1);
                    }
                }
                parsedLines[j, i++] = line;
            }
        }
    }
}

// TCO reverse support
if(drawingTimer){
    drawingTimer--;
}

//Trummel and Alto reverse support
if(codecOut){
    codecTimer++;
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
        case 1:
        case 7:
        case 9:
        case 10:
        case 11:
            if(other.runeN){
                attackDir = newDir;
                state = newState;
                state_timer = 0;
            }
            break;
    }
}
if(runeN){
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