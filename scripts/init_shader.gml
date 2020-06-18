// init shader

if(!("prevAlt2" in self)){
    prevAlt2 = get_player_color(player);
    ranCSSDraw = false;
}


//EA
if (get_player_color(player) == 7 && get_color_profile_slot_r(0, 8) == 0){
    for(i = 0; i < 8; i++){
        set_character_color_shading(i, 0);
    }
}

//Wireframe
if (get_player_color(player) == 1 && get_color_profile_slot_r(0, 8) == 1){
    // Wireframe alt
    set_character_color_slot( 0, 0, 0, 0, 0 ); //Jacket
    set_character_color_slot( 1, 0, 0, 0, 0 ); //Skin/Pot
    set_character_color_slot( 2, 0, 0, 0, 0 ); //Pants
    set_character_color_slot( 3, 0, 0, 0, 0 ); //Hair
    set_character_color_slot( 4, 0, 0, 0, 0 ); //Shoe/Shirt Light
    set_character_color_slot( 5, 0, 0, 0, 0 ); //Shoe/Shirt Dark
    set_character_color_slot( 6, 0, 0, 0, 0 ); //Stem
    set_character_color_slot( 7, 0, 0, 0, 0 ); //Leaves
    // Obama alt article colors
    set_article_color_slot( 0, 0, 0, 0, 0 ); //Jacket
    set_article_color_slot( 1, 0, 0, 0, 0 ); //Skin/Pot
    set_article_color_slot( 2, 0, 0, 0, 0 ); //Pants
    set_article_color_slot( 3, 0, 0, 0, 0 ); //Hair
    set_article_color_slot( 4, 0, 0, 0, 0 ); //Shoe/Shirt Light
    set_article_color_slot( 5, 0, 0, 0, 0 ); //Shoe/Shirt Dark
    set_article_color_slot( 6, 0, 0, 0, 0 ); //Stem
    set_article_color_slot( 7, 0, 0, 0, 0 ); //Leaves
}

//non-first row first alts
if (get_player_color(player) == 0){
    if(get_color_profile_slot_g(0, 8) == 1){
        // Obama alt
        set_character_color_slot( 0, 76, 76, 76, 256 ); //Jacket
        set_character_color_slot( 1, 178, 114, 45, 256 ); //Skin/Pot
        set_character_color_slot( 2, 76, 76, 76, 256 ); //Pants
        set_character_color_slot( 3, 67, 51, 31, 256 ); //Hair
        set_character_color_slot( 4, 55, 55, 55, 256 ); //Shoe/Shirt Light
        set_character_color_slot( 5, 43, 43, 43, 256 ); //Shoe/Shirt Dark
        set_character_color_slot( 6, 224, 224, 224, 256 ); //Stem
        set_character_color_slot( 7, 255, 57, 57, 256 ); //Leaves
        // Obama alt article colors
        set_article_color_slot( 0, 76, 76, 76, 256 ); //Jacket
        set_article_color_slot( 1, 240, 64, 68, 256 ); //Skin/Pot
        set_article_color_slot( 2, 76, 76, 76, 256 ); //Pants
        set_article_color_slot( 3, 67, 51, 31, 256 ); //Hair
        set_article_color_slot( 4, 55, 55, 55, 256 ); //Shoe/Shirt Light
        set_article_color_slot( 5, 43, 43, 43, 256 ); //Shoe/Shirt Dark
        set_article_color_slot( 6, 224, 224, 224, 256 ); //Stem
        set_article_color_slot( 7, 255, 57, 57, 256 ); //Leaves
    }
}

// This makes it so that when switch from the first alt to the last of a row, there isn't a flicker
if (ranCSSDraw && get_player_color(player) == 15){
    if(get_color_profile_slot_r(0, 8) == 1 && prevAlt2 == 0){
        // Giik alt
        set_character_color_slot( 0, 254, 254, 254, 256 ); //Jacket
        set_character_color_slot( 1, 59, 37, 47, 256 ); //Skin/Pot
        set_character_color_slot( 2, 253, 220, 153, 256 ); //Pants
        set_character_color_slot( 3, 253, 220, 153, 256 ); //Hair
        set_character_color_slot( 4, 80, 56, 55, 256 ); //Shoe/Shirt Light
        set_character_color_slot( 5, 59, 37, 47, 256 ); //Shoe/Shirt Dark
        set_character_color_slot( 6, 254, 254, 254, 256 ); //Stem
        set_character_color_slot( 7, 253, 220, 153, 256 ); //Leaves
        // Giik alt article colors
        set_article_color_slot( 0, 254, 254, 254, 256 ); //Jacket
        set_article_color_slot( 1, 59, 37, 47, 256 ); //Skin/Pot
        set_article_color_slot( 2, 253, 220, 153, 256 ); //Pants
        set_article_color_slot( 3, 253, 220, 153, 256 ); //Hair
        set_article_color_slot( 4, 80, 56, 55, 256 ); //Shoe/Shirt Light
        set_article_color_slot( 5, 59, 37, 47, 256 ); //Shoe/Shirt Dark
        set_article_color_slot( 6, 254, 254, 254, 256 ); //Stem
        set_article_color_slot( 7, 253, 220, 153, 256 ); //Leaves
    } else if(get_color_profile_slot_r(0, 8) == 0 && prevAlt2 == 0){
        // Feri alt
        set_character_color_slot( 0, 17, 126, 23, 256 ); //Jacket
        set_character_color_slot( 1, 169, 71, 225, 256 ); //Skin/Pot
        set_character_color_slot( 2, 43, 51, 203, 256 ); //Pants
        set_character_color_slot( 3, 75, 10, 240, 256 ); //Hair
        set_character_color_slot( 4, 168, 19, 19, 256 ); //Shoe/Shirt Light
        set_character_color_slot( 5, 168, 19, 19, 256 ); //Shoe/Shirt Dark
        set_character_color_slot( 6, 17, 126, 23, 256 ); //Stem
        set_character_color_slot( 7, 255, 48, 224, 256 ); //Leaves
        // Feri alt article colors
        set_article_color_slot( 0, 17, 126, 23, 256 ); //Jacket
        set_article_color_slot( 1, 169, 71, 225, 256 ); //Skin/Pot
        set_article_color_slot( 2, 43, 51, 203, 256 ); //Pants
        set_article_color_slot( 3, 75, 10, 240, 256 ); //Hair
        set_article_color_slot( 4, 168, 19, 19, 256 ); //Shoe/Shirt Light
        set_article_color_slot( 5, 168, 19, 19, 256 ); //Shoe/Shirt Dark
        set_article_color_slot( 6, 17, 126, 23, 256 ); //Stem
        set_article_color_slot( 7, 255, 48, 224, 256 ); //Leaves
    }
}

ranCSSDraw = false;
prevAlt2 = get_player_color(player);