//hitbox init

if(attack == AT_FTILT && hbox_num == 1){
    if(player_id.attack == AT_BAIR){
        spr_dir = -player_id.spr_dir;
        hsp = -hsp;
    }else{
        spr_dir = player_id.spr_dir;
    }
}