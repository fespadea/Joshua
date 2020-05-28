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
    
}