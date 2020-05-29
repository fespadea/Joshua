// batit update

switch(state) {
    case 0: //idle
        checkForTaunt();
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
        checkForTaunt();
        checkForNudge();
        checkForDamage();
        checkForBomb();
        if(state_timer == 1){
            sprite_index = sprite[1];
            changeDir(-attackDir);
        }
        if(state_timer < 16){
            image_index = floor(state_timer/8);
        } else if (state_timer < 19){
            image_index = 2;
        } else {
            image_index = floor((state_timer-19)/20) + 3;
        }
        if(state_timer == 16){
            create_hitbox(AT_FTILT, 1, x+10*attackDir, y-25).fx_particles = 1;
        } else if (state_timer == 59){
            changeState(0);
        }
        break;
    case 3: // nudge
        checkForTaunt();
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
        } else if((hsp != 0 || free || nudgePrevVsp != 0) && instance_exists(bumpBox)){
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
            if(nudgePrevVsp > 6){
                vsp = -nudgePrevVsp/3;
                nudgeBounced = true;
            } else if (nudgePrevVsp < 0){
                vsp = nudgePrevVsp+player_id.gravity_speed + min(player_id.air_friction, -vsp);
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
        checkForTaunt();
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
        checkForTaunt();
        checkForNudge();
        checkForDamage();
        checkForBomb();
        if(state_timer == 1){
            sprite_index = sprite[7];
        }
        if(state_timer < 16){
            image_index = floor(state_timer/8);
        } else if (state_timer < 19){
            image_index = 2;
        } else {
            image_index = floor((state_timer - 19)/20) + 3;
        }
        if(state_timer == 16){
            create_hitbox(AT_UTILT, 2, x, y-49).fx_particles = 1;
        } else if (state_timer == 59){
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
            changeState(2);
        }
        break;
    case 9: //nspecial attack
        checkForTaunt();
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
        checkForTaunt();
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
            changeDir(attackDir);
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
        checkForTaunt();
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
    case 12: // taunt
        checkForNudge();
        checkForDamage();
        checkForBomb();
        if(state_timer == 1){
            sprite_index = sprite[12];
        }
        image_index = floor(state_timer/6);
        if(!(player_id.state == PS_ATTACK_GROUND && player_id.attack == AT_TAUNT_2)){
            changeState(0);
        }
        break;
}

article_timer++;
state_timer++;
depth = player_id.depth - 1;
can_be_grounded = true;
ignores_walls = false;
if (free && vsp > 0){ // this code is to prevent Batit from falling through platforms
    var platformCollidedWith = collision_rectangle(x-4+hsp,y-1+vsp,x+5+hsp,y+1+vsp,asset_get("par_jumpthrough"),false, true);
    var currentPlatformCollededWith = collision_rectangle(x-4,y-1,x+5,y+1,asset_get("par_jumpthrough"),false, true);
    if(platformCollidedWith != noone && platformCollidedWith != currentPlatformCollededWith){
        free = false;
        vsp = 0;
        while(!place_meeting(x, y+1, platformCollidedWith)){
            y++;
        }
    }
}
if(free){
    if(state == 6) vsp += player_id.hitstun_grav;
    else vsp += player_id.gravity_speed;
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
    changeState(2);
}

if(state == 2){ //despawn
    player_id.batitPlaced = false;
    instance_destroy();
    exit;
}

#define changeState(newState)
state = newState;
state_timer = 0;

#define changeWindow(newWindow)
window = newWindow;
window_timer = 0;

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
        if(other.player_id.player != player){
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
        var highestPriority = -11;
        var attackFacing = noone;
        for(var i = previousNumDamages; i < numDamages; i++){
            if(attacksFaced[i].hit_priority > highestPriority){
                attackFacing = attacksFaced[i];
            } else if (!(attackFacing.player == attacksFaced[i].player && attackFacing.attack == attacksFaced[i].attack && attackFacing.hbox_group == attacksFaced[i].hbox_group)){
                attacksFaced[i] = noone;
            }
        }
        knockBackAngle = get_hitbox_angle(attackFacing);
        knockBackPower = attackFacing.kb_value + attackFacing.kb_scale*(50-batitHealth)*.12;
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
if(player_id.autoNudge ? !player_id.shield_down : player_id.shield_down){
    with pHitBox {
        if(player == other.player_id.player && id != other.nudgeHitboxID) {
            if(attack != AT_TAUNT_2 && type != 2 && attack != AT_FSPECIAL){
                if((!instance_exists(other.nudgeHitboxID) || (other.nudgeHitboxID.hit_priority < hit_priority && other.hitByDTilt)) && place_meeting(x, y, other)){
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
                vsp = -2*nudgeDamage*sin(nudgeAngle);
                break;
            case AT_NAIR:
                hsp = 2*nudgeDamage*cos(nudgeAngle);
                vsp = -2*nudgeDamage*sin(nudgeAngle);
                break;
            case AT_DSTRONG:
                hsp = nudgeDamage*cos(nudgeAngle);
                vsp = -nudgeDamage*sin(nudgeAngle);
                break;
            case AT_UAIR:
                hsp = 1.6*nudgeBaseKnockback*cos(nudgeAngle);
                vsp = -1.6*nudgeBaseKnockback*sin(nudgeAngle);
                break;
            case AT_UTILT:
                hsp = 2.5*nudgeDamage*cos(nudgeAngle);
                vsp = -2.5*nudgeDamage*sin(nudgeAngle);
                break;
            default:
                hsp = max((1+nudgeKnockbackScaling)*nudgeBaseKnockback*cos(nudgeAngle), (1+nudgeKnockbackScaling)*nudgeDamage*cos(nudgeAngle));
                vsp = max(-(1+nudgeKnockbackScaling)*nudgeBaseKnockback*sin(nudgeAngle), -(1+nudgeKnockbackScaling)*nudgeDamage*sin(nudgeAngle));
                break;
        }
        if(!free && vsp > 0){
            vsp *= -1;
        }
        hitByDTilt = false;
        if(state == 0 || state == 3){
            changeState(3);
        }
    }
}

#define checkForTaunt()
if(player_id.attack == AT_TAUNT_2 && player_id.state == PS_ATTACK_GROUND){
    with pHitBox {
        if(player == other.player_id.player) {
            if(attack == AT_TAUNT_2){
                if(place_meeting(x, y, other)){
                    other.tauntTime = true;
                }
            }
        }
    }
    if(tauntTime){
        if(state == 0){
            changeState(12);
        }
        batitHealth = 50;
        tauntTime = false;
    }
}