// batit update

switch(state) {
    case 0: //idle
        checkForNudge();
        checkForDamage();
        checkForBomb();
        if(state_timer == 1) sprite_index = sprite[0];
        image_index = floor(state_timer/8);
        if (player_id.attack == AT_FSPECIAL){
            with pHitBox {
                if(player == other.player_id.player && attack == AT_FSPECIAL && hbox_num == 1) {
                    if (place_meeting(x, y, other)){
                        player_id.pickUpBatit = true;
                    }
                }
            }
        }
        break;
    case 1: // ftilt/fair/bair attack
        checkForNudge();
        checkForDamage();
        checkForBomb();
        if(state_timer == 1){
            sprite_index = sprite[1];
            if(player_id.attack == AT_BAIR)
                changeDir(player_id.spr_dir);
            else
                changeDir(-player_id.spr_dir);
        }
        if(state_timer < 16){
            image_index = floor(state_timer/8);
        } else if (state_timer < 19){
            image_index = 2;
        } else {
            image_index = floor((state_timer-19)/8) + 3;
        }
        if(state_timer == 16){
            create_hitbox(AT_FTILT, 1, x+10*player_id.spr_dir*(player_id.attack == AT_BAIR ? -1 : 1), y-25).fx_particles = 1;
        } else if (state_timer == 32){
            changeState(0);
        }
        break;
    case 2: //despawn
        despawn();
        break;
    case 3: // nudge
        checkForNudge();
        checkForBomb();
        if(state_timer == 1){
            if(hsp < 0)
                changeDir(-1);
            else if (hsp > 0)
                changeDir(1);
            bumpBox = create_hitbox(AT_DTILT, 2, x, y-20);
            bumpBox.spr_dir = player_id.spr_dir;
            bumpBox.damage = nudgeDamage;
            bumpBox.kb_angle = radtodeg(nudgeAngle);
            bumpBox.kb_value = nudgeBaseKnockback;
            bumpBox.kb_scale = nudgeKnockbackScaling;
            nudgeBounced = false;
        } else if(hsp != 0 || free || nudgePrevVsp != 0){
            bumpBox.x = x + hsp;
            bumpBox.y = y + bumpBox.y_pos + vsp;
            bumpBox.length += 1;
        } else {
            bumpBox.length = 0;
            bumpBox = noone;
            changeState(0);
        }
        if(free){
            if(abs(hsp) < 2){
                if(vsp < 0 && !nudgeBounced){
                    sprite_index = nudgeUpSprite;
                    image_index = floor(state_timer/3) % 3;
                } else {
                    sprite_index = nudgeUpFallSprite;
                    image_index  = 0;
                }
            } else {
                sprite_index = sprite[3];
                if(free){
                    image_index = floor(state_timer/3) % 3;
                } else{
                    image_index  = 3;
                }
            }
        } else {
            if(nudgePrevVsp > 3){
                vsp = -nudgePrevVsp/3;
                nudgeBounced = true;
            }
        }
        nudgePrevVsp = vsp;
        break;
    case 4: //spawn
        checkForDamage();
        if(state_timer == 1) sprite_index = sprite[4];
        else if(state_timer == 38) changeState(0);
        else image_index = floor(state_timer/8);
        break;
    case 5: //killed
        if(state_timer == 1) sprite_index = sprite[5];
        if(image_index < 5) image_index = floor(state_timer)/12;
        if(state_timer > 70) changeState(2);
        break;
    case 6: //knockback
        checkForNudge();
        if(state_timer == 1){
            sprite_index = sprite[6];
            image_index = 0;
            hsp = lengthdir_x(knockBackPower, knockBackAngle);
            vsp = lengthdir_y(knockBackPower, knockBackAngle);
            if(hsp < 0) spr_dir = -1;
            else if(hsp > 0) spr_dir = 1;
        }
        checkForDamage();
        checkForBomb();
        if(hsp == 0 && vsp == 0) changeState(0);
        break;
    case 7: // utilt/uair attack
        checkForNudge();
        checkForDamage();
        checkForBomb();
        if(state_timer == 1){
            sprite_index = sprite[7];
            changeDir(player_id.spr_dir);
        }
        if(state_timer < 16){
            image_index = floor(state_timer/8);
        } else if (state_timer < 19){
            image_index = 2;
        } else {
            image_index = floor((state_timer - 19)/8) + 3;
        }
        if(state_timer == 16){
            create_hitbox(AT_UTILT, 2, x, y-49).fx_particles = 1;
        } else if (state_timer == 32){
            changeState(0);
        }
        break;
    case 8: // exploding attack
        image_index = floor(state_timer/6);
        if(state_timer == 1){
            sprite_index = sprite[8];
        } else if(state_timer == 30){
            sound_play(explode);
            create_hitbox(AT_DSPECIAL_AIR, 2, x+2*spr_dir, y-36);
        } else if(state_timer == 42){
            create_hitbox(AT_DSPECIAL_AIR, 3, x+2*spr_dir, y-24);
        } else if(image_index > 9){
            player_id.batitDied = true;
            despawn();
        }
        break;
    case 9: //nspecial attack
        checkForNudge();
        checkForDamage();
        checkForBomb();
        image_index = floor(state_timer/6);
        if(state_timer == 0){
            sprite_index = sprite[9];
        } else if(state_timer == 37 || state_timer == 49){
            create_hitbox(AT_NSPECIAL, 1, x+9*spr_dir, y-25).fx_particles = 1;
            sound_play(asset_get("sfx_rag_plant_shoot"));
        } else if(image_index > 10){
            changeState(0);
        }
        break;
    case 10: //fstrong
        checkForNudge();
        checkForDamage();
        checkForBomb();
        if(state_timer == 0){
            sprite_index = sprite[10];
            changeWindow(0);
            window0Length = 15;
            window1Length = 2;
            window2Length = 17;
            strongCharge = 0;
            changeDir(strongDir);
        }
        if(window == 0){
            if(window_timer >= window0Length){
                if(window_timer % 10 == 0){
                    sprite_index = sprite[10];
                    image_index = 2;
                } else if(window_timer % 10 == 5){
                    sprite_index = fstrongChargeSprite;
                    image_index = 0;
                }
                if((player_id.strong_down || player_id.right_strong_down || player_id.left_strong_down || player_id.down_strong_down || player_id.up_strong_down) && strongCharge < 61){
                    strongCharge++;
                } else {
                    sprite_index = sprite[10];
                    image_index = 2;
                    sound_play(asset_get("sfx_swipe_heavy1"));
                    changeWindow(1);
                }
            } else {
                image_index = floor(window_timer/(window0Length/3));
            }
        } else if (window == 1){
            if(window_timer == 1){
                mehBox = create_hitbox(AT_FSTRONG, 3, x+20*spr_dir, y-21);
                mehBox.damage *= 1 + strongCharge/120;
                mehBox.fx_particles = 2;
                sweetBox = create_hitbox(AT_FSTRONG, 4, x+55*spr_dir, y-20);
                sweetBox.damage *= 1 + strongCharge/120;
                sweetBox.fx_particles = 1;
            } else if(window_timer == window1Length) changeWindow(2);
            mehBox.x = x+20*spr_dir + hsp;
            mehBox.y = y-21 + vsp;
            sweetBox.x = x+55*spr_dir + hsp;
            sweetBox.y = y-20 + vsp;
            image_index = 3;
        } else {
            image_index = 4;
            if(window_timer == window2Length) changeState(0);
        } 
        window_timer++;
        break;
    case 11: //ustrong
        checkForNudge();
        checkForDamage();
        checkForBomb();
        if(state_timer == 0){
            sprite_index = sprite[11];
            changeWindow(0);
            window0Length = 13;
            window1Length = 5;
            window2Length = 5;
            strongCharge = 0;
            changeDir(strongDir);
        }
        if(window == 0){
            if(window_timer >= window0Length){
                if(window_timer % 10 == 0){
                    sprite_index = sprite[11];
                    image_index = 2;
                } else if(window_timer % 10 == 5){
                    sprite_index = ustrongChargeSprite;
                    image_index = 0;
                }
                if((player_id.strong_down || player_id.right_strong_down || player_id.left_strong_down || player_id.down_strong_down || player_id.up_strong_down) && strongCharge < 61){
                    strongCharge++;
                } else {
                    sprite_index = sprite[11];
                    image_index = 2;
                    changeWindow(1);
                }
            } else {
                image_index = floor(window_timer/(window0Length/3));
            }
        } else if (window == 1){
            image_index = floor(window_timer/(window1Length/2)) + 3;
            if(window_timer == 2){
                sound_play(asset_get("sfx_swipe_heavy2"));
            } else if(window_timer == 3){
                attackBox = create_hitbox(AT_USTRONG, 2, x+1*spr_dir, y-37);
                attackBox.damage *= 1 + strongCharge/120;
                attackBox.fx_particles = 2;
            } else if(window_timer == window1Length){
                changeWindow(2);
            }
            if(window_timer >= 3){
                attackBox.x = x+1*spr_dir + hsp;
                attackBox.y = y-37 + vsp;
            }
        } else {
            image_index = 5;
            if(window_timer == window2Length) changeState(0);
        }
        window_timer++;
        break;
}

article_timer++;
state_timer++;
depth = player_id.depth - 1;
can_be_grounded = true;
ignores_walls = false;
if(free){
    if(state == 6) vsp += player_id.hitstun_grav;
    else vsp += player_id.gravity_speed-.01;
    if(vsp > 0)
        vsp -= min(player_id.air_friction, vsp);
    else if(vsp < 0)
        vsp += min(player_id.air_friction, -vsp);
    if(hsp > 0)
        hsp -= min(player_id.air_friction, hsp);
    else if(hsp < 0)
        hsp += min(player_id.air_friction, -hsp);
} else {
    if(hsp > 0)
        hsp -= min(player_id.ground_friction, hsp);
    else if(hsp < 0)
        hsp += min(player_id.ground_friction, -hsp);
}
if(y > BOTTOM_BLASTZONE_Y_POS || y < TOP_BLASTZONE_Y_POS || x < LEFT_BLASTZONE_X_POS || x > RIGHT_BLASTZONE_X_POS){
    player_id.batitFell = true;
    despawn();
}

#define changeState(newState)
state = newState;
state_timer = 0;

#define changeWindow(newWindow)
window = newWindow;
window_timer = 0;

#define despawn()
player_id.batitPlaced = false;
instance_destroy();
exit;

#define changeDir(newDir)
if(newDir != spr_dir){
    x -= 2*newDir;
    spr_dir = newDir;
}

#define checkForDamage()
if(batitHealth < 1){
    player_id.batitDied = true;
    if(state != 6) changeState(5);
} else {
    var previousNumDamages = numDamages;
    with pHitBox{
        if(other.player_id != player_id){
            var repeatHitbox = false;
            for(var i = 0; i < other.numDamages; i++){
                if(other.attacksFaced[i] == id){
                    repeatHitbox = true;
                }
            }
            if(!repeatHitbox && place_meeting(x, y, other)){
                other.attacksFaced[other.numDamages] = id;
                other.numDamages++;
                other.hitstop += hitpause + extra_hitpause;
                other.batitHealth -= min(damage, other.batitHealth);
                sound_play(sound_effect);
                spawn_hit_fx( other.x, other.y-20, hit_effect);
            }
        }
    }
    if(previousNumDamages < numDamages){
        knockBackAngle = get_hitbox_angle(attacksFaced[numDamages-1]);
        knockBackPower = attacksFaced[numDamages-1].kb_value + attacksFaced[numDamages-1].kb_scale*(50-batitHealth)/5;
        changeState(6);
    }
}

#define checkForBomb()
with pHitBox {
    if(player == other.player_id.player) {
        if (attack == AT_DSPECIAL_AIR && hbox_num == 1){
            if(!destroyed && place_meeting(x, y, other)){
                other.explode = sound_effect;
                length = hitbox_timer + 2;
            }
        }
    }
}
if(explode) changeState(8);

#define checkForNudge()
if(player_id.attack == AT_DTILT || player_id.attack == AT_DSTRONG || player_id.attack == AT_DSPECIAL_2 || player_id.attack == AT_NAIR || player_id.attack == AT_DAIR){
    with pHitBox {
        if(player == other.player_id.player && id != other.nudgeHitboxID) {
            if((attack == AT_DTILT && hbox_num == 1) || attack == AT_DSTRONG || attack == AT_DSPECIAL_2 || attack == AT_NAIR || attack == AT_DAIR){
                if(place_meeting(x, y, other)){
                    other.nudgeHitboxID = id;
                    other.hitByDTilt = true;
                    sound_play(sound_effect);
                    spawn_hit_fx(other.x, other.y-20, hit_effect);
                    other.nudgeAttack = attack;
                    if(attack == AT_DSTRONG){
                        other.nudgeDamage = damage*(1 + player_id.strong_charge/120);
                    } else {
                        other.nudgeDamage = damage;
                    }
                    other.nudgeAngle = degtorad(get_hitbox_angle(id));
                    other.nudgeBaseKnockback = kb_value;
                    other.nudgeKnockbackScaling = kb_scale;
                }
            }
        }
    }
    if(hitByDTilt){
        switch(nudgeAttack){
            case AT_DTILT:
                hsp = nudgeDamage*cos(nudgeAngle);
                vsp = -2.5*nudgeDamage*sin(nudgeAngle);
                break;
            case AT_DSPECIAL_2:
                vsp = -1.5*nudgeDamage;
                break;
            case AT_DAIR:
                if(!free){
                    vsp = 2*nudgeDamage*sin(nudgeAngle);
                } else {
                    vsp = -2*nudgeDamage*sin(nudgeAngle);
                }
                break;
            case AT_NAIR:
                hsp = 2*nudgeDamage*cos(nudgeAngle);
                vsp = -2*nudgeDamage*sin(nudgeAngle);
                break;
            default:
                hsp = nudgeDamage*cos(nudgeAngle);
                vsp = -nudgeDamage*sin(nudgeAngle);
                break;
        }
        hitByDTilt = false;
        if(state == 0 || state == 3){
            changeState(3);
        }
    }
}