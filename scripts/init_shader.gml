// init shader

NUM_ALTS = 32;
if("alt_name" in self || !("ping_color" in self)){
    var curAlt = get_player_color(player);
    var curRealAlt = sprite_get_xoffset(sprite_get("dog"));
    var prevAlt = sprite_get_yoffset(sprite_get("dog"));
    if(curAlt != prevAlt){
        if((curAlt > prevAlt && curAlt < prevAlt + 8) || curAlt < prevAlt - 8){
            curRealAlt++;
            if(curRealAlt == NUM_ALTS){
                curRealAlt = 0;
            }
        } else{
            if(curRealAlt == 0){
                curRealAlt = NUM_ALTS;
            }
            curRealAlt--;
        }
    }

    switch(curRealAlt){
        case 0:
            // Default alt
            set_character_color_slot( 0, 57, 92, 104, 256 ); //Jacket
            set_character_color_slot( 1, 216, 155, 141, 256 ); //Skin/Pot
            set_character_color_slot( 2, 111, 170, 193, 256 ); //Pants
            set_character_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_character_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 149, 67, 94, 256 ); //Stem
            set_character_color_slot( 7, 82, 180, 127, 256 ); //Leaves
            // Default alt article colors
            set_article_color_slot( 0, 57, 92, 104, 256 ); //Jacket
            set_article_color_slot( 1, 216, 155, 141, 256 ); //Skin/Pot
            set_article_color_slot( 2, 111, 170, 193, 256 ); //Pants
            set_article_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_article_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 149, 67, 94, 256 ); //Stem
            set_article_color_slot( 7, 82, 180, 127, 256 ); //Leaves
            break;
        case 1:
            // Hime alt
            set_character_color_slot( 0, 116, 184, 229, 256 ); //Jacket
            set_character_color_slot( 1, 223, 155, 154, 256 ); //Skin/Pot
            set_character_color_slot( 2, 206, 180, 167, 256 ); //Pants
            set_character_color_slot( 3, 109, 140, 161, 256 ); //Hair
            set_character_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 255, 254, 255, 256 ); //Stem
            set_character_color_slot( 7, 237, 127, 126, 256 ); //Leaves
            // Hime alt article colors
            set_article_color_slot( 0, 116, 184, 229, 256 ); //Jacket
            set_article_color_slot( 1, 223, 155, 154, 256 ); //Skin/Pot
            set_article_color_slot( 2, 206, 180, 167, 256 ); //Pants
            set_article_color_slot( 3, 109, 140, 161, 256 ); //Hair
            set_article_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 255, 254, 255, 256 ); //Stem
            set_article_color_slot( 7, 237, 127, 126, 256 ); //Leaves
            break;
        case 2:
            // Liz alt
            set_character_color_slot( 0, 0, 0, 0, 256 ); //Jacket
            set_character_color_slot( 1, 204, 119, 119, 256 ); //Skin/Pot
            set_character_color_slot( 2, 245, 95, 140, 256 ); //Pants
            set_character_color_slot( 3, 245, 95, 140, 256 ); //Hair
            set_character_color_slot( 4, 41, 41, 100, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 37, 21, 71, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 93, 244, 188, 256 ); //Stem
            set_character_color_slot( 7, 93, 244, 188, 256 ); //Leaves
            // Liz alt article colors
            set_article_color_slot( 0, 0, 0, 0, 256 ); //Jacket
            set_article_color_slot( 1, 204, 119, 119, 256 ); //Skin/Pot
            set_article_color_slot( 2, 245, 95, 140, 256 ); //Pants
            set_article_color_slot( 3, 245, 95, 140, 256 ); //Hair
            set_article_color_slot( 4, 41, 41, 100, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 37, 21, 71, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 93, 244, 188, 256 ); //Stem
            set_article_color_slot( 7, 93, 244, 188, 256 ); //Leaves
            break;
        case 3:
            // Acid Rainbows alt
            set_character_color_slot( 0, 71, 185, 89, 256 ); //Jacket
            set_character_color_slot( 1, 221, 159, 134, 256 ); //Skin/Pot
            set_character_color_slot( 2, 149, 176, 196, 256 ); //Pants
            set_character_color_slot( 3, 182, 73, 218, 256 ); //Hair
            set_character_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 213, 41, 77, 256 ); //Stem
            set_character_color_slot( 7, 118, 37, 54, 256 ); //Leaves
            // Acid Rainbows alt article colors
            set_article_color_slot( 0, 71, 185, 89, 256 ); //Jacket
            set_article_color_slot( 1, 221, 159, 134, 256 ); //Skin/Pot
            set_article_color_slot( 2, 149, 176, 196, 256 ); //Pants
            set_article_color_slot( 3, 182, 73, 218, 256 ); //Hair
            set_article_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 213, 41, 77, 256 ); //Stem
            set_article_color_slot( 7, 118, 37, 54, 256 ); //Leaves
            break;
        case 4:
            // Donyoku alt
            set_character_color_slot( 0, 76, 89, 92, 256 ); //Jacket
            set_character_color_slot( 1, 192, 172, 123, 256 ); //Skin/Pot
            set_character_color_slot( 2, 243, 157, 25, 256 ); //Pants
            set_character_color_slot( 3, 62, 64, 96, 256 ); //Hair
            set_character_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 243, 157, 25, 256 ); //Stem
            set_character_color_slot( 7, 50, 206, 225, 256 ); //Leaves
            // Donyoku alt article colors
            set_article_color_slot( 0, 76, 89, 92, 256 ); //Jacket
            set_article_color_slot( 1, 192, 172, 123, 256 ); //Skin/Pot
            set_article_color_slot( 2, 243, 157, 25, 256 ); //Pants
            set_article_color_slot( 3, 62, 64, 96, 256 ); //Hair
            set_article_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 243, 157, 25, 256 ); //Stem
            set_article_color_slot( 7, 50, 206, 225, 256 ); //Leaves
            break;
        case 5:
            // Pomme alt
            set_character_color_slot( 0, 167, 83, 132, 256 ); //Jacket
            set_character_color_slot( 1, 233, 190, 224, 256 ); //Skin/Pot
            set_character_color_slot( 2, 251, 234, 244, 256 ); //Pants
            set_character_color_slot( 3, 241, 140, 214, 256 ); //Hair
            set_character_color_slot( 4, 66, 26, 91, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 35, 13, 64, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 251, 234, 244, 256 ); //Stem
            set_character_color_slot( 7, 183, 101, 184, 256 ); //Leaves
            // Pomme alt article colors
            set_article_color_slot( 0, 167, 83, 132, 256 ); //Jacket
            set_article_color_slot( 1, 233, 190, 224, 256 ); //Skin/Pot
            set_article_color_slot( 2, 251, 234, 244, 256 ); //Pants
            set_article_color_slot( 3, 241, 140, 214, 256 ); //Hair
            set_article_color_slot( 4, 66, 26, 91, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 35, 13, 64, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 251, 234, 244, 256 ); //Stem
            set_article_color_slot( 7, 183, 101, 184, 256 ); //Leaves
            break;
        case 6:
            // Abyss alt
            set_character_color_slot( 0, 116, 94, 135, 256 ); //Jacket
            set_character_color_slot( 1, 111, 127, 188, 256 ); //Skin/Pot
            set_character_color_slot( 2, 79, 61, 94, 256 ); //Pants
            set_character_color_slot( 3, 79, 61, 94, 256 ); //Hair
            set_character_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 220, 113, 255, 256 ); //Stem
            set_character_color_slot( 7, 166, 172, 214, 256 ); //Leaves
            // Abyss alt article colors
            set_article_color_slot( 0, 116, 94, 135, 256 ); //Jacket
            set_article_color_slot( 1, 111, 127, 188, 256 ); //Skin/Pot
            set_article_color_slot( 2, 79, 61, 94, 256 ); //Pants
            set_article_color_slot( 3, 79, 61, 94, 256 ); //Hair
            set_article_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 220, 113, 255, 256 ); //Stem
            set_article_color_slot( 7, 166, 172, 214, 256 ); //Leaves
            break;
        case 7:
            // Early Access alt
            set_character_color_slot( 0, 83, 122, 62, 256 ); //Jacket
            set_character_color_slot( 1, 211, 226, 154, 256 ); //Skin/Pot
            set_character_color_slot( 2, 167, 186, 74, 256 ); //Pants
            set_character_color_slot( 3, 83, 122, 62, 256 ); //Hair
            set_character_color_slot( 4, 211, 226, 154, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 211, 226, 154, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 83, 122, 62, 256 ); //Stem
            set_character_color_slot( 7, 167, 186, 74, 256 ); //Leaves
            // Early Access alt article colors
            set_article_color_slot( 0, 83, 122, 62, 256 ); //Jacket
            set_article_color_slot( 1, 211, 226, 154, 256 ); //Skin/Pot
            set_article_color_slot( 2, 167, 186, 74, 256 ); //Pants
            set_article_color_slot( 3, 83, 122, 62, 256 ); //Hair
            set_article_color_slot( 4, 211, 226, 154, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 211, 226, 154, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 83, 122, 62, 256 ); //Stem
            set_article_color_slot( 7, 167, 186, 74, 256 ); //Leaves
            // set shading to 0
            for(i = 0; i < 8; i++){
                set_character_color_shading(i, 0);
            }
            break;
        case 8:
            // Contest One alt
            set_character_color_slot( 0, 155, 70, 70, 256 ); //Jacket
            set_character_color_slot( 1, 225, 175, 155, 256 ); //Skin/Pot
            set_character_color_slot( 2, 63, 53, 53, 256 ); //Pants
            set_character_color_slot( 3, 123, 80, 56, 256 ); //Hair
            set_character_color_slot( 4, 111, 53, 53, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 75, 34, 34, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 55, 105, 70, 256 ); //Stem
            set_character_color_slot( 7, 53, 47, 56, 256 ); //Leaves
            // Contest One alt article colors
            set_article_color_slot( 0, 155, 70, 70, 256 ); //Jacket
            set_article_color_slot( 1, 225, 175, 155, 256 ); //Skin/Pot
            set_article_color_slot( 2, 63, 53, 53, 256 ); //Pants
            set_article_color_slot( 3, 123, 80, 56, 256 ); //Hair
            set_article_color_slot( 4, 111, 53, 53, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 75, 34, 34, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 55, 105, 70, 256 ); //Stem
            set_article_color_slot( 7, 53, 47, 56, 256 ); //Leaves
            break;
        case 9:
            // Sans alt
            set_character_color_slot( 0, 104, 151, 205, 256 ); //Jacket
            set_character_color_slot( 1, 212, 192, 190, 256 ); //Skin/Pot
            set_character_color_slot( 2, 207, 233, 252, 256 ); //Pants
            set_character_color_slot( 3, 177, 177, 177, 256 ); //Hair
            set_character_color_slot( 4, 215, 216, 218, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 163, 166, 177, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 93, 139, 97, 256 ); //Stem
            set_character_color_slot( 7, 240, 135, 189, 256 ); //Leaves
            // Sans alt article colors
            set_article_color_slot( 0, 104, 151, 205, 256 ); //Jacket
            set_article_color_slot( 1, 212, 192, 190, 256 ); //Skin/Pot
            set_article_color_slot( 2, 207, 233, 252, 256 ); //Pants
            set_article_color_slot( 3, 177, 177, 177, 256 ); //Hair
            set_article_color_slot( 4, 215, 216, 218, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 163, 166, 177, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 93, 139, 97, 256 ); //Stem
            set_article_color_slot( 7, 240, 135, 189, 256 ); //Leaves
            break;
        case 10:
            // Contest Three alt
            set_character_color_slot( 0, 221, 221, 221, 256 ); //Jacket
            set_character_color_slot( 1, 229, 194, 175, 256 ); //Skin/Pot
            set_character_color_slot( 2, 96, 90, 88, 256 ); //Pants
            set_character_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_character_color_slot( 4, 85, 133, 104, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 63, 104, 79, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 115, 119, 125, 256 ); //Stem
            set_character_color_slot( 7, 201, 87, 87, 256 ); //Leaves
            // Contest Three alt article colors
            set_article_color_slot( 0, 221, 221, 221, 256 ); //Jacket
            set_article_color_slot( 1, 229, 194, 175, 256 ); //Skin/Pot
            set_article_color_slot( 2, 96, 90, 88, 256 ); //Pants
            set_article_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_article_color_slot( 4, 85, 133, 104, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 63, 104, 79, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 115, 119, 125, 256 ); //Stem
            set_article_color_slot( 7, 201, 87, 87, 256 ); //Leaves
            break;
        case 11:
            // Content Four alt
            set_character_color_slot( 0, 182, 99, 156, 256 ); //Jacket
            set_character_color_slot( 1, 232, 178, 199, 256 ); //Skin/Pot
            set_character_color_slot( 2, 163, 42, 71, 256 ); //Pants
            set_character_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_character_color_slot( 4, 222, 187, 217, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 192, 155, 196, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 177, 46, 122, 256 ); //Stem
            set_character_color_slot( 7, 203, 127, 143, 256 ); //Leaves
            // Content Four alt article colors
            set_article_color_slot( 0, 182, 99, 156, 256 ); //Jacket
            set_article_color_slot( 1, 232, 178, 199, 256 ); //Skin/Pot
            set_article_color_slot( 2, 163, 42, 71, 256 ); //Pants
            set_article_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_article_color_slot( 4, 222, 187, 217, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 192, 155, 196, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 177, 46, 122, 256 ); //Stem
            set_article_color_slot( 7, 203, 127, 143, 256 ); //Leaves
            break;
        case 12:
            // Voidfox alt
            set_character_color_slot( 0, 113, 181, 88, 256 ); //Jacket
            set_character_color_slot( 1, 255, 255, 255, 256 ); //Skin/Pot
            set_character_color_slot( 2, 49, 49, 49, 256 ); //Pants
            set_character_color_slot( 3, 0, 0, 0, 256 ); //Hair
            set_character_color_slot( 4, 255, 255, 255, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 167, 161, 173, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 49, 49, 49, 256 ); //Stem
            set_character_color_slot( 7, 52, 96, 36, 256 ); //Leaves
            // Voidfox alt article colors
            set_article_color_slot( 0, 113, 181, 88, 256 ); //Jacket
            set_article_color_slot( 1, 255, 255, 255, 256 ); //Skin/Pot
            set_article_color_slot( 2, 49, 49, 49, 256 ); //Pants
            set_article_color_slot( 3, 0, 0, 0, 256 ); //Hair
            set_article_color_slot( 4, 255, 255, 255, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 167, 161, 173, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 49, 49, 49, 256 ); //Stem
            set_article_color_slot( 7, 52, 96, 36, 256 ); //Leaves
            break;
        case 13:
            // Classic alt
            set_character_color_slot( 0, 34, 52, 94, 256 ); //Jacket
            set_character_color_slot( 1, 202, 113, 113, 256 ); //Skin/Pot
            set_character_color_slot( 2, 67, 66, 116, 256 ); //Pants
            set_character_color_slot( 3, 43, 42, 42, 256 ); //Hair
            set_character_color_slot( 4, 202, 227, 225, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 174, 195, 199, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 69, 24, 40, 256 ); //Stem
            set_character_color_slot( 7, 65, 125, 146, 256 ); //Leaves
            // Classic alt article colors
            set_article_color_slot( 0, 34, 52, 94, 256 ); //Jacket
            set_article_color_slot( 1, 202, 113, 113, 256 ); //Skin/Pot
            set_article_color_slot( 2, 67, 66, 116, 256 ); //Pants
            set_article_color_slot( 3, 43, 42, 42, 256 ); //Hair
            set_article_color_slot( 4, 202, 227, 225, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 174, 195, 199, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 69, 24, 40, 256 ); //Stem
            set_article_color_slot( 7, 65, 125, 146, 256 ); //Leaves
            break;
        case 14:
            // Kris alt
            set_character_color_slot( 0, 255, 119, 205, 256 ); //Jacket
            set_character_color_slot( 1, 117, 250, 237, 256 ); //Skin/Pot
            set_character_color_slot( 2, 68, 68, 145, 256 ); //Pants
            set_character_color_slot( 3, 33, 33, 81, 256 ); //Hair
            set_character_color_slot( 4, 201, 228, 242, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 113, 113, 156, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 237, 148, 165, 256 ); //Stem
            set_character_color_slot( 7, 237, 148, 165, 256 ); //Leaves
            // Kris alt article colors
            set_article_color_slot( 0, 255, 119, 205, 256 ); //Jacket
            set_article_color_slot( 1, 117, 250, 237, 256 ); //Skin/Pot
            set_article_color_slot( 2, 68, 68, 145, 256 ); //Pants
            set_article_color_slot( 3, 33, 33, 81, 256 ); //Hair
            set_article_color_slot( 4, 201, 228, 242, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 113, 113, 156, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 237, 148, 165, 256 ); //Stem
            set_article_color_slot( 7, 237, 148, 165, 256 ); //Leaves
            break;
        case 15:
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
            break;
        case 16:
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
            set_article_color_slot( 1, 178, 114, 45, 256 ); //Skin/Pot
            set_article_color_slot( 2, 76, 76, 76, 256 ); //Pants
            set_article_color_slot( 3, 67, 51, 31, 256 ); //Hair
            set_article_color_slot( 4, 55, 55, 55, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 43, 43, 43, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 224, 224, 224, 256 ); //Stem
            set_article_color_slot( 7, 255, 57, 57, 256 ); //Leaves
            break;
        case 17:
            // Wireframe alt
            set_character_color_slot( 0, 0, 0, 0, 0 ); //Jacket
            set_character_color_slot( 1, 0, 0, 0, 0 ); //Skin/Pot
            set_character_color_slot( 2, 0, 0, 0, 0 ); //Pants
            set_character_color_slot( 3, 0, 0, 0, 0 ); //Hair
            set_character_color_slot( 4, 0, 0, 0, 0 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 0, 0, 0, 0 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 0, 0, 0, 0 ); //Stem
            set_character_color_slot( 7, 0, 0, 0, 0 ); //Leaves
            // Wireframe alt article colors
            set_article_color_slot( 0, 0, 0, 0, 0 ); //Jacket
            set_article_color_slot( 1, 0, 0, 0, 0 ); //Skin/Pot
            set_article_color_slot( 2, 0, 0, 0, 0 ); //Pants
            set_article_color_slot( 3, 0, 0, 0, 0 ); //Hair
            set_article_color_slot( 4, 0, 0, 0, 0 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 0, 0, 0, 0 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 0, 0, 0, 0 ); //Stem
            set_article_color_slot( 7, 0, 0, 0, 0 ); //Leaves
            break;
        case 18:
            // Ellie alt
            set_character_color_slot( 0, 186, 235, 254, 256 ); //Jacket
            set_character_color_slot( 1, 217, 176, 100, 256 ); //Skin/Pot
            set_character_color_slot( 2, 53, 115, 183, 256 ); //Pants
            set_character_color_slot( 3, 249, 244, 153, 256 ); //Hair
            set_character_color_slot( 4, 248, 248, 248, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 216, 220, 222, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 31, 31, 31, 256 ); //Stem
            set_character_color_slot( 7, 120, 231, 243, 256 ); //Leaves
            // Ellie alt article colors
            set_article_color_slot( 0, 186, 235, 254, 256 ); //Jacket
            set_article_color_slot( 1, 217, 176, 100, 256 ); //Skin/Pot
            set_article_color_slot( 2, 53, 115, 183, 256 ); //Pants
            set_article_color_slot( 3, 249, 244, 153, 256 ); //Hair
            set_article_color_slot( 4, 248, 248, 248, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 216, 220, 222, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 31, 31, 31, 256 ); //Stem
            set_article_color_slot( 7, 120, 231, 243, 256 ); //Leaves
            break;
        case 19:
            // Adam Carra alt
            set_character_color_slot( 0, 75, 75, 75, 256 ); //Jacket
            set_character_color_slot( 1, 216, 155, 141, 256 ); //Skin/Pot
            set_character_color_slot( 2, 255, 243, 23, 256 ); //Pants
            set_character_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_character_color_slot( 4, 255, 255, 255, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 222, 222, 222, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 44, 43, 43, 256 ); //Stem
            set_character_color_slot( 7, 191, 164, 19, 256 ); //Leaves
            // Adam Carra alt article colors
            set_article_color_slot( 0, 75, 75, 75, 256 ); //Jacket
            set_article_color_slot( 1, 216, 155, 141, 256 ); //Skin/Pot
            set_article_color_slot( 2, 255, 243, 23, 256 ); //Pants
            set_article_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_article_color_slot( 4, 255, 255, 255, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 222, 222, 222, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 44, 43, 43, 256 ); //Stem
            set_article_color_slot( 7, 191, 164, 19, 256 ); //Leaves
            break;
        case 20:
            // Junior High alt
            set_character_color_slot( 0, 55, 97, 149, 256 ); //Jacket
            set_character_color_slot( 1, 216, 155, 141, 256 ); //Skin/Pot
            set_character_color_slot( 2, 197, 166, 126, 256 ); //Pants
            set_character_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_character_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 187, 230, 231, 256 ); //Stem
            set_character_color_slot( 7, 155, 170, 235, 256 ); //Leaves
            // Junior High alt article colors
            set_article_color_slot( 0, 55, 97, 149, 256 ); //Jacket
            set_article_color_slot( 1, 216, 155, 141, 256 ); //Skin/Pot
            set_article_color_slot( 2, 197, 166, 126, 256 ); //Pants
            set_article_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_article_color_slot( 4, 224, 222, 220, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 191, 178, 181, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 187, 230, 231, 256 ); //Stem
            set_article_color_slot( 7, 155, 170, 235, 256 ); //Leaves
            break;
        case 21:
            // Zircon alt
            set_character_color_slot( 0, 1, 229, 255, 256 ); //Jacket
            set_character_color_slot( 1, 209, 94, 60, 256 ); //Skin/Pot
            set_character_color_slot( 2, 1, 229, 255, 256 ); //Pants
            set_character_color_slot( 3, 249, 246, 240, 256 ); //Hair
            set_character_color_slot( 4, 249, 246, 240, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 224, 211, 193, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 129, 39, 39, 256 ); //Stem
            set_character_color_slot( 7, 1, 229, 255, 256 ); //Leaves
            // Zircon alt article colors
            set_article_color_slot( 0, 1, 229, 255, 256 ); //Jacket
            set_article_color_slot( 1, 209, 94, 60, 256 ); //Skin/Pot
            set_article_color_slot( 2, 1, 229, 255, 256 ); //Pants
            set_article_color_slot( 3, 249, 246, 240, 256 ); //Hair
            set_article_color_slot( 4, 249, 246, 240, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 224, 211, 193, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 129, 39, 39, 256 ); //Stem
            set_article_color_slot( 7, 1, 229, 255, 256 ); //Leaves
            break;
        case 22:
            // Sakurai alt
            set_character_color_slot( 0, 53, 53, 53, 256 ); //Jacket
            set_character_color_slot( 1, 215, 142, 103, 256 ); //Skin/Pot
            set_character_color_slot( 2, 27, 22, 37, 256 ); //Pants
            set_character_color_slot( 3, 85, 49, 42, 256 ); //Hair
            set_character_color_slot( 4, 111, 46, 46, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 75, 31, 31, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 111, 46, 46, 256 ); //Stem
            set_character_color_slot( 7, 53, 53, 53, 256 ); //Leaves
            // Sakurai alt article colors
            set_article_color_slot( 0, 53, 53, 53, 256 ); //Jacket
            set_article_color_slot( 1, 215, 142, 103, 256 ); //Skin/Pot
            set_article_color_slot( 2, 27, 22, 37, 256 ); //Pants
            set_article_color_slot( 3, 85, 49, 42, 256 ); //Hair
            set_article_color_slot( 4, 111, 46, 46, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 75, 31, 31, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 111, 46, 46, 256 ); //Stem
            set_article_color_slot( 7, 53, 53, 53, 256 ); //Leaves
            break;
        case 23:
            // Lucy alt
            set_character_color_slot( 0, 67, 58, 54, 256 ); //Jacket
            set_character_color_slot( 1, 211, 176, 146, 256 ); //Skin/Pot
            set_character_color_slot( 2, 95, 20, 45, 256 ); //Pants
            set_character_color_slot( 3, 221, 179, 145, 256 ); //Hair
            set_character_color_slot( 4, 240, 242, 244, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 175, 188, 210, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 95, 20, 45, 256 ); //Stem
            set_character_color_slot( 7, 240, 242, 244, 256 ); //Leaves
            // Lucy alt article colors
            set_article_color_slot( 0, 67, 58, 54, 256 ); //Jacket
            set_article_color_slot( 1, 211, 176, 146, 256 ); //Skin/Pot
            set_article_color_slot( 2, 95, 20, 45, 256 ); //Pants
            set_article_color_slot( 3, 221, 179, 145, 256 ); //Hair
            set_article_color_slot( 4, 240, 242, 244, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 175, 188, 210, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 95, 20, 45, 256 ); //Stem
            set_article_color_slot( 7, 240, 242, 244, 256 ); //Leaves
            break;
        case 24:
            // Starfy alt
            set_character_color_slot( 0, 227, 107, 132, 256 ); //Jacket
            set_character_color_slot( 1, 243, 191, 29, 256 ); //Skin/Pot
            set_character_color_slot( 2, 255, 239, 67, 256 ); //Pants
            set_character_color_slot( 3, 243, 191, 29, 256 ); //Hair
            set_character_color_slot( 4, 255, 239, 67, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 243, 191, 29, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 227, 107, 132, 256 ); //Stem
            set_character_color_slot( 7, 117, 217, 255, 256 ); //Leaves
            // Starfy alt article colors
            set_article_color_slot( 0, 227, 107, 132, 256 ); //Jacket
            set_article_color_slot( 1, 243, 191, 29, 256 ); //Skin/Pot
            set_article_color_slot( 2, 255, 239, 67, 256 ); //Pants
            set_article_color_slot( 3, 243, 191, 29, 256 ); //Hair
            set_article_color_slot( 4, 255, 239, 67, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 243, 191, 29, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 227, 107, 132, 256 ); //Stem
            set_article_color_slot( 7, 117, 217, 255, 256 ); //Leaves
            break;
        case 25:
            // Yes, Indeed alt
            set_character_color_slot( 0, 75, 71, 64, 256 ); //Jacket
            set_character_color_slot( 1, 164, 123, 91, 256 ); //Skin/Pot
            set_character_color_slot( 2, 146, 129, 116, 256 ); //Pants
            set_character_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_character_color_slot( 4, 227, 193, 169, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 164, 123, 91, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 57, 54, 47, 256 ); //Stem
            set_character_color_slot( 7, 227, 193, 169, 256 ); //Leaves
            // Yes, Indeed alt article colors
            set_article_color_slot( 0, 75, 71, 64, 256 ); //Jacket
            set_article_color_slot( 1, 164, 123, 91, 256 ); //Skin/Pot
            set_article_color_slot( 2, 146, 129, 116, 256 ); //Pants
            set_article_color_slot( 3, 51, 44, 41, 256 ); //Hair
            set_article_color_slot( 4, 227, 193, 169, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 164, 123, 91, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 57, 54, 47, 256 ); //Stem
            set_article_color_slot( 7, 227, 193, 169, 256 ); //Leaves
            break;
        case 26:
            // Smolburn alt
            set_character_color_slot( 0, 122, 90, 78, 256 ); //Jacket
            set_character_color_slot( 1, 175, 126, 62, 256 ); //Skin/Pot
            set_character_color_slot( 2, 122, 92, 80, 256 ); //Pants
            set_character_color_slot( 3, 255, 124, 0, 256 ); //Hair
            set_character_color_slot( 4, 220, 203, 105, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 175, 126, 62, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 255, 124, 0, 256 ); //Stem
            set_character_color_slot( 7, 255, 228, 0, 256 ); //Leaves
            // Smolburn alt article colors
            set_article_color_slot( 0, 122, 90, 78, 256 ); //Jacket
            set_article_color_slot( 1, 175, 126, 62, 256 ); //Skin/Pot
            set_article_color_slot( 2, 122, 92, 80, 256 ); //Pants
            set_article_color_slot( 3, 255, 124, 0, 256 ); //Hair
            set_article_color_slot( 4, 220, 203, 105, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 175, 126, 62, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 255, 124, 0, 256 ); //Stem
            set_article_color_slot( 7, 255, 228, 0, 256 ); //Leaves
            break;
        case 27:
            // Minicane alt
            set_character_color_slot( 0, 59, 73, 135, 256 ); //Jacket
            set_character_color_slot( 1, 130, 173, 177, 256 ); //Skin/Pot
            set_character_color_slot( 2, 59, 73, 135, 256 ); //Pants
            set_character_color_slot( 3, 59, 73, 135, 256 ); //Hair
            set_character_color_slot( 4, 205, 247, 247, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 130, 173, 177, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 59, 73, 135, 256 ); //Stem
            set_character_color_slot( 7, 130, 173, 177, 256 ); //Leaves
            // Minicane alt article colors
            set_article_color_slot( 0, 59, 73, 135, 256 ); //Jacket
            set_article_color_slot( 1, 130, 173, 177, 256 ); //Skin/Pot
            set_article_color_slot( 2, 59, 73, 135, 256 ); //Pants
            set_article_color_slot( 3, 59, 73, 135, 256 ); //Hair
            set_article_color_slot( 4, 205, 247, 247, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 130, 173, 177, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 59, 73, 135, 256 ); //Stem
            set_article_color_slot( 7, 130, 173, 177, 256 ); //Leaves
            break;
        case 28:
            // Wrastiny alt
            set_character_color_slot( 0, 97, 68, 96, 256 ); //Jacket
            set_character_color_slot( 1, 129, 60, 116, 256 ); //Skin/Pot
            set_character_color_slot( 2, 230, 218, 25, 256 ); //Pants
            set_character_color_slot( 3, 97, 68, 96, 256 ); //Hair
            set_character_color_slot( 4, 246, 173, 197, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 210, 135, 180, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 182, 182, 182, 256 ); //Stem
            set_character_color_slot( 7, 141, 231, 255, 256 ); //Leaves
            // Wrastiny alt article colors
            set_article_color_slot( 0, 97, 68, 96, 256 ); //Jacket
            set_article_color_slot( 1, 129, 60, 116, 256 ); //Skin/Pot
            set_article_color_slot( 2, 230, 218, 25, 256 ); //Pants
            set_article_color_slot( 3, 97, 68, 96, 256 ); //Hair
            set_article_color_slot( 4, 246, 173, 197, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 210, 135, 180, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 182, 182, 182, 256 ); //Stem
            set_article_color_slot( 7, 141, 231, 255, 256 ); //Leaves
            break;
        case 29:
            // MunchKragg alt
            set_character_color_slot( 0, 187, 155, 143, 256 ); //Jacket
            set_character_color_slot( 1, 79, 122, 62, 256 ); //Skin/Pot
            set_character_color_slot( 2, 79, 122, 62, 256 ); //Pants
            set_character_color_slot( 3, 187, 155, 143, 256 ); //Hair
            set_character_color_slot( 4, 213, 216, 221, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 139, 149, 167, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 213, 216, 221, 256 ); //Stem
            set_character_color_slot( 7, 137, 105, 93, 256 ); //Leaves
            // MunchKragg alt article colors
            set_article_color_slot( 0, 187, 155, 143, 256 ); //Jacket
            set_article_color_slot( 1, 79, 122, 62, 256 ); //Skin/Pot
            set_article_color_slot( 2, 79, 122, 62, 256 ); //Pants
            set_article_color_slot( 3, 187, 155, 143, 256 ); //Hair
            set_article_color_slot( 4, 213, 216, 221, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 139, 149, 167, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 213, 216, 221, 256 ); //Stem
            set_article_color_slot( 7, 137, 105, 93, 256 ); //Leaves
            break;
        case 30:
            // Buch alt
            set_character_color_slot( 0, 39, 92, 171, 256 ); //Jacket
            set_character_color_slot( 1, 200, 200, 240, 256 ); //Skin/Pot
            set_character_color_slot( 2, 130, 56, 64, 256 ); //Pants
            set_character_color_slot( 3, 107, 126, 146, 256 ); //Hair
            set_character_color_slot( 4, 220, 203, 105, 256 ); //Shoe/Shirt Light
            set_character_color_slot( 5, 200, 126, 30, 256 ); //Shoe/Shirt Dark
            set_character_color_slot( 6, 107, 126, 146, 256 ); //Stem
            set_character_color_slot( 7, 59, 73, 135, 256 ); //Leaves
            // Buch alt article colors
            set_article_color_slot( 0, 39, 92, 171, 256 ); //Jacket
            set_article_color_slot( 1, 200, 200, 240, 256 ); //Skin/Pot
            set_article_color_slot( 2, 130, 56, 64, 256 ); //Pants
            set_article_color_slot( 3, 107, 126, 146, 256 ); //Hair
            set_article_color_slot( 4, 220, 203, 105, 256 ); //Shoe/Shirt Light
            set_article_color_slot( 5, 200, 126, 30, 256 ); //Shoe/Shirt Dark
            set_article_color_slot( 6, 107, 126, 146, 256 ); //Stem
            set_article_color_slot( 7, 59, 73, 135, 256 ); //Leaves
            break;
        case 31:
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
            break;
    }

    sprite_change_offset("dog", curRealAlt, curAlt ); // x is the actual alt and is the previous normal alt
}