//hitbox init

if(attack == AT_FTILT && hbox_num == 1){ //direction and stuff
    if(player_id.attack == AT_BAIR){
        spr_dir = -player_id.spr_dir;
        hsp = -hsp;
    }else{
        spr_dir = player_id.spr_dir;
    }
} else if (attack == AT_NSPECIAL && hbox_num == 1){ //targetting leaves
    targetPlayer = noone;
    with oPlayer{
        if(player != other.player){
            distanceToLeaf = point_distance(other.x, other.y, x, y);
            if(other.targetPlayer == noone || distanceToLeaf < other.targetPlayer.distanceToLeaf){
                other.targetPlayer = id;
            }
        }
    }
    maxSpeed = 2;
    angleToTarget = 0;
    percentAngle = 0;
    newAngle = 0;
    MAX_ANGLE_CHANGE = 7;
    if(player_id.batitArticle.spr_dir == -1){
        proj_angle = 135;
        spr_dir = 1;
    }else{
        proj_angle = 45;
        spr_dir = 1;
    }
    //follower vfx
    leafFollowerVFX = hit_fx_create(sprite_get("batit_nspecial_particle_fx"), 15);
} else if (attack == AT_FSTRONG && (hbox_num == 3 || hbox_num == 4)){
    hbox_group = 2;
}