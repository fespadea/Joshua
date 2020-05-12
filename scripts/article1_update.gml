// batit update

if(state == 0){ //idle
    checkForDamage()
    if(state_timer == 1) sprite_index = sprite[0];
    image_index = floor(state_timer/8);
    if(player_id.attack == AT_DTILT){
        with pHitBox {
            if(attack == AT_DTILT && hbox_num == 1 && player == other.player_id.player) {
                other.hitByDTilt = place_meeting(x, y, other);
            }
        }
        if(hitByDTilt) changeState(3);
    }
} else if(state == 1){ // ftilt/fair/bair attack
    if(state_timer == 1){
        sprite_index = sprite[1];
        if(player_id.attack == AT_BAIR)
            changeDir(player_id.spr_dir);
        else
            changeDir(-player_id.spr_dir);
    }
    if(state_timer < 16){
        image_index = floor(state_timer/8);
    } else if (state_timer < 18){
        image_index = 2;
    } else {
        image_index = floor(state_timer/8) + 6;
    }
    if(state_timer == 16){
        create_hitbox(AT_FTILT, 1, x+10*player_id.spr_dir*(player_id.attack == AT_BAIR ? -1 : 1), y-20);
    } else if (state_timer == 32){
        changeState(0);
    }
} else if(state == 2){ //despawn
    despawn();
} else if(state == 3){ // dtilt nudge
    if(state_timer == 1){
        changeDir(player_id.spr_dir)
        hsp = 5*spr_dir;
        vsp = -2;
        bumpBox = create_hitbox(AT_DTILT, 2, x, y-20);
        bumpBox.spr_dir = player_id.spr_dir;
        sprite_index = sprite[3];
    } else if(player_id.state != PS_ATTACK_GROUND){
        hitByDTilt = false;
        changeState(0);
    } else if(hsp != 0){
        bumpBox.x = x;
        bumpBox.y = y + bumpBox.y_pos;
        bumpBox.length += 1;
        if(free)
            image_index = floor(state_timer/3) % 3;
        else
            image_index  = 3;
    } else {
        bumpBox.length = 0;
    }
} else if(state == 4){ //spawn
    checkForDamage()
    if(state_timer == 1) sprite_index = sprite[4];
    else if(state_timer == 38) changeState(0);
    else image_index = floor(state_timer/8);
} else if(state == 5){ //killed
    if(state_timer == 1) sprite_index = sprite[5];
    if(image_index < 5) image_index = floor(state_timer)/12;
    if(state_timer > 70) changeState(2);
} else if(state == 6){ //knockback
    if(state_timer == 1){
        sprite_index = sprite[6];
        image_index = 0;
        hsp = lengthdir_x(knockBackPower, knockBackAngle);
        vsp = lengthdir_y(knockBackPower, knockBackAngle);
        if(hsp < 0) spr_dir = -1;
        else if(hsp > 0) spr_dir = 1;
    }
    checkForDamage();
    if(hsp == 0 && vsp == 0) changeState(0);
}

article_timer++;
state_timer++;
depth = player_id.depth - 1;
can_be_grounded = true;
if(free){
    if(state != 6) vsp += player_id.hitstun_grav;
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
if(y > BOTTOM_BLASTZONE_Y_POS){
    player_id.batitFell = true;
    despawn();
}

#define changeState(newState)
state = newState;
state_timer = 0;

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