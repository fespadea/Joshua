//ai update

if(ai_recovering){
    if(temp_level > 6){
        if(state != PS_ATTACK_AIR){
            if(!has_airdodge && batitDelay < 1 && (!has_walljump && (y > BOTTOM_BLASTZONE_Y_POS - 300 || (y > BOTTOM_BLASTZONE_Y_POS - 400 && (x < LEFT_BLASTZONE_X_POS + 400 || x > RIGHT_BLASTZONE_X_POS - 400))) || (y > BOTTOM_BLASTZONE_Y_POS - 400 && (x < LEFT_BLASTZONE_X_POS + 300 || x > RIGHT_BLASTZONE_X_POS - 300))) && !sacrificeBatit){
                special_pressed = true;
                down_down = true;
                sacrificeBatit = true;
            } else if(sacrificeBatit){
                special_pressed = true;
                down_down = true;
                boostOffBatit = true;
                sacrificeBatit = false;
            }
        } else if(boostOffBatit){
            special_pressed = true;
            down_down = true;
            boostOffBatit = false;
        }
    }
}

if(get_training_cpu_action() == CPU_FIGHT){
    if(batitDelay < 1 && !free && !batitPlaced && get_player_damage(player) < 80){ // place Batit because this seems like a reasonable time to do it
        special_pressed = true;
        down_down = true;
    } else if(batitPlaced && (batitArticle.state == 0 || temp_level < 3) && batitArticle.batitHealth < 40/9*temp_level && place_meeting(x, y, batitArticle)){ // decides if the cpu will replenish Batit quickly if nearby when their health is low enough (higher level means they'll do this sooner)
        special_pressed = true;
        if(batitArticle.x > x)
            right_down = true;
        else
            left_down = true;
    } else if(batitPlaced && (batitArticle.state == 0 || batitArticle.state == 3) && temp_level > 1 && (batitAttackDelay <= 0 || temp_level > 8)){
        if(ai_target.y > batitArticle.y - 25 && ai_target.y < batitArticle.y - 25 + ai_target.char_height){ //check that enemy is about level with batit
            batitAttackDelay = 600 / temp_level;
            if(ai_target.x > batitArticle.x){
                if(ai_target.x > batitArticle.x + 60 || temp_level < 7){ //projectile
                    right_down = true;
                    attack_pressed = true;
                } else { //strong (only for high level cpus)
                    right_strong_pressed = true;
                }
            } else {
                if(ai_target.x < batitArticle.x - 60 || temp_level < 7){ //projectile
                    left_down = true;
                    attack_pressed = true;
                } else { //strongs (only for high level cpus)
                    left_strong_pressed = true;
                }
            }
        } else if(ai_target.x > batitArticle.x - 60 && ai_target.x < batitArticle.x + 60 && ai_target.y < batitArticle.y){
            batitAttackDelay = 600 / temp_level;
            if(ai_target.y < batitArticle.y - 60 || temp_level < 7){ //projectile
                up_down = true;
                attack_pressed = true;
            } else { //strong (only for high level cpus)
                up_strong_pressed = true;
            }
        } else if(move_cooldown[AT_NSPECIAL] < 1){
            batitAttackDelay = 600 / temp_level;
            special_pressed = true;
        }
    }
    batitAttackDelay--;
}