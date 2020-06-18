var temp_x = x + 8;
var temp_y = y + 9;

patch_ver = "3";
patch_day = "17";
patch_month = "JUNE";

var num_alts = 16;
var alt_cur = get_player_color(player);

if(!("row" in self)){
    row = get_color_profile_slot_r(0, 8);
    prevAlt = alt_cur;
    rowAltsSet = false;
    prevTime = current_time;
}
ranCSSDraw = true;
// multiple rows code
#macro NUM_ROWS 2
if(alt_cur == 0 && prevAlt == 15){
    row++;
    rowAltsSet = false;
    if(row == NUM_ROWS){
        row = 0;
    }
} else if(alt_cur == 15 && prevAlt == 0){
    row--;
    rowAltsSet = false;
    if(row == -1){
        row = NUM_ROWS-1;
    }
}
if(get_color_profile_slot_b(0, 8) < current_time - 500 && prevTime < current_time - 500){
    row = 0;
    rowAltsSet = false;
    set_color_profile_slot(0, 8, row, 0, current_time);
    init_shader();
}
set_color_profile_slot(0, 8, row, alt_cur > 8 ? (row == NUM_ROWS - 1 ? 0 : row+1) : row, current_time);
prevTime = current_time;
prevAlt = alt_cur;
if(!rowAltsSet){
    if(row == 0){
        // Hime
        set_color_profile_slot( 1, 0, 116, 184, 229 ); //Jacket
        set_color_profile_slot( 1, 1, 223, 155, 154 ); //Skin/Pot
        set_color_profile_slot( 1, 2, 206, 180, 167 ); //Pants
        set_color_profile_slot( 1, 3, 109, 140, 161 ); //Hair
        set_color_profile_slot( 1, 4, 224, 222, 220 ); //Shoe/Shirt Light
        set_color_profile_slot( 1, 5, 191, 178, 181 ); //Shoe/Shirt Dark
        set_color_profile_slot( 1, 6, 255, 254, 255 ); //Stem
        set_color_profile_slot( 1, 7, 237, 127, 126 ); //Leaves

        // Liz
        set_color_profile_slot( 2, 0, 0, 0, 0 ); //Jacket
        set_color_profile_slot( 2, 1, 204, 119, 119 ); //Skin/Pot
        set_color_profile_slot( 2, 2, 245, 95, 140 ); //Pants
        set_color_profile_slot( 2, 3, 245, 95, 140 ); //Hair
        set_color_profile_slot( 2, 4, 41, 41, 100 ); //Shoe/Shirt Light
        set_color_profile_slot( 2, 5, 37, 21, 71 ); //Shoe/Shirt Dark
        set_color_profile_slot( 2, 6, 93, 244, 188 ); //Stem
        set_color_profile_slot( 2, 7, 93, 244, 188 ); //Leaves

        // Acid Rainbows
        set_color_profile_slot( 3, 0, 71, 185, 89 ); //Jacket
        set_color_profile_slot( 3, 1, 221, 159, 134 ); //Skin/Pot
        set_color_profile_slot( 3, 2, 149, 176, 196 ); //Pants
        set_color_profile_slot( 3, 3, 182, 73, 218 ); //Hair
        set_color_profile_slot( 3, 4, 224, 222, 220 ); //Shoe/Shirt Light
        set_color_profile_slot( 3, 5, 191, 178, 181 ); //Shoe/Shirt Dark
        set_color_profile_slot( 3, 6, 213, 41, 77 ); //Stem
        set_color_profile_slot( 3, 7, 118, 37, 54 ); //Leaves

        // Donyoku
        set_color_profile_slot( 4, 0, 76, 89, 92 ); //Jacket
        set_color_profile_slot( 4, 1, 192, 172, 123 ); //Skin/Pot
        set_color_profile_slot( 4, 2, 243, 157, 25 ); //Pants
        set_color_profile_slot( 4, 3, 62, 64, 96 ); //Hair
        set_color_profile_slot( 4, 4, 224, 222, 220 ); //Shoe/Shirt Light
        set_color_profile_slot( 4, 5, 191, 178, 181 ); //Shoe/Shirt Dark
        set_color_profile_slot( 4, 6, 243, 157, 25 ); //Stem
        set_color_profile_slot( 4, 7, 50, 206, 225 ); //Leaves

        // Pomme
        set_color_profile_slot( 5, 0, 167, 83, 132 ); //Jacket
        set_color_profile_slot( 5, 1, 233, 190, 224 ); //Skin/Pot
        set_color_profile_slot( 5, 2, 251, 234, 244 ); //Pants
        set_color_profile_slot( 5, 3, 241, 140, 214 ); //Hair
        set_color_profile_slot( 5, 4, 66, 26, 91 ); //Shoe/Shirt Light
        set_color_profile_slot( 5, 5, 35, 13, 64 ); //Shoe/Shirt Dark
        set_color_profile_slot( 5, 6, 251, 234, 244 ); //Stem
        set_color_profile_slot( 5, 7, 183, 101, 184 ); //Leaves

        // Abyss
        set_color_profile_slot( 6, 0, 116, 94, 135 ); //Jacket
        set_color_profile_slot( 6, 1, 111, 127, 188 ); //Skin/Pot
        set_color_profile_slot( 6, 2, 79, 61, 94 ); //Pants
        set_color_profile_slot( 6, 3, 79, 61, 94 ); //Hair
        set_color_profile_slot( 6, 4, 224, 222, 220 ); //Shoe/Shirt Light
        set_color_profile_slot( 6, 5, 191, 178, 181 ); //Shoe/Shirt Dark
        set_color_profile_slot( 6, 6, 220, 113, 255 ); //Stem
        set_color_profile_slot( 6, 7, 166, 172, 214 ); //Leaves

        // Early Access
        set_color_profile_slot( 7, 0, 83, 122, 62 ); //Jacket
        set_color_profile_slot( 7, 1, 211, 226, 154 ); //Skin/Pot
        set_color_profile_slot( 7, 2, 167, 186, 74 ); //Pants
        set_color_profile_slot( 7, 3, 83, 122, 62 ); //Hair
        set_color_profile_slot( 7, 4, 211, 226, 154 ); //Shoe/Shirt Light
        set_color_profile_slot( 7, 5, 211, 226, 154 ); //Shoe/Shirt Dark
        set_color_profile_slot( 7, 6, 83, 122, 62 ); //Stem
        set_color_profile_slot( 7, 7, 167, 186, 74 ); //Leaves

        // Contest One
        set_color_profile_slot( 8, 0, 155, 70, 70 ); //Jacket
        set_color_profile_slot( 8, 1, 225, 175, 155 ); //Skin/Pot
        set_color_profile_slot( 8, 2, 63, 53, 53 ); //Pants
        set_color_profile_slot( 8, 3, 123, 80, 56 ); //Hair
        set_color_profile_slot( 8, 4, 111, 53, 53 ); //Shoe/Shirt Light
        set_color_profile_slot( 8, 5, 75, 34, 34 ); //Shoe/Shirt Dark
        set_color_profile_slot( 8, 6, 55, 105, 70 ); //Stem
        set_color_profile_slot( 8, 7, 53, 47, 56 ); //Leaves

        // Sans
        set_color_profile_slot( 9, 0, 104, 151, 205 ); //Jacket
        set_color_profile_slot( 9, 1, 212, 192, 190 ); //Skin/Pot
        set_color_profile_slot( 9, 2, 207, 233, 252 ); //Pants
        set_color_profile_slot( 9, 3, 177, 177, 177 ); //Hair
        set_color_profile_slot( 9, 4, 215, 216, 218 ); //Shoe/Shirt Light
        set_color_profile_slot( 9, 5, 163, 166, 177 ); //Shoe/Shirt Dark
        set_color_profile_slot( 9, 6, 93, 139, 97 ); //Stem
        set_color_profile_slot( 9, 7, 240, 135, 189 ); //Leaves

        // Contest Three
        set_color_profile_slot( 10, 0, 221, 221, 221 ); //Jacket
        set_color_profile_slot( 10, 1, 229, 194, 175 ); //Skin/Pot
        set_color_profile_slot( 10, 2, 96, 90, 88 ); //Pants
        set_color_profile_slot( 10, 3, 51, 44, 41 ); //Hair
        set_color_profile_slot( 10, 4, 85, 133, 104 ); //Shoe/Shirt Light
        set_color_profile_slot( 10, 5, 63, 104, 79 ); //Shoe/Shirt Dark
        set_color_profile_slot( 10, 6, 115, 119, 125 ); //Stem
        set_color_profile_slot( 10, 7, 201, 87, 87 ); //Leaves

        // Content Four
        set_color_profile_slot( 11, 0, 182, 99, 156 ); //Jacket
        set_color_profile_slot( 11, 1, 232, 178, 199 ); //Skin/Pot
        set_color_profile_slot( 11, 2, 163, 42, 71 ); //Pants
        set_color_profile_slot( 11, 3, 51, 44, 41 ); //Hair
        set_color_profile_slot( 11, 4, 222, 187, 217 ); //Shoe/Shirt Light
        set_color_profile_slot( 11, 5, 192, 155, 196 ); //Shoe/Shirt Dark
        set_color_profile_slot( 11, 6, 177, 46, 122 ); //Stem
        set_color_profile_slot( 11, 7, 203, 127, 143 ); //Leaves

        // Voidfox
        set_color_profile_slot( 12, 0, 113, 181, 88 ); //Jacket
        set_color_profile_slot( 12, 1, 255, 255, 255 ); //Skin/Pot
        set_color_profile_slot( 12, 2, 49, 49, 49 ); //Pants
        set_color_profile_slot( 12, 3, 0, 0, 0 ); //Hair
        set_color_profile_slot( 12, 4, 255, 255, 255 ); //Shoe/Shirt Light
        set_color_profile_slot( 12, 5, 167, 161, 173 ); //Shoe/Shirt Dark
        set_color_profile_slot( 12, 6, 49, 49, 49 ); //Stem
        set_color_profile_slot( 12, 7, 52, 96, 36 ); //Leaves

        // Classic
        set_color_profile_slot( 13, 0, 34, 52, 94 ); //Jacket
        set_color_profile_slot( 13, 1, 202, 113, 113 ); //Skin/Pot
        set_color_profile_slot( 13, 2, 67, 66, 116 ); //Pants
        set_color_profile_slot( 13, 3, 43, 42, 42 ); //Hair
        set_color_profile_slot( 13, 4, 202, 227, 225 ); //Shoe/Shirt Light
        set_color_profile_slot( 13, 5, 174, 195, 199 ); //Shoe/Shirt Dark
        set_color_profile_slot( 13, 6, 69, 24, 40 ); //Stem
        set_color_profile_slot( 13, 7, 65, 125, 146 ); //Leaves

        // Kris
        set_color_profile_slot( 14, 0, 255, 119, 205 ); //Jacket
        set_color_profile_slot( 14, 1, 117, 250, 237 ); //Skin/Pot
        set_color_profile_slot( 14, 2, 68, 68, 145 ); //Pants
        set_color_profile_slot( 14, 3, 33, 33, 81 ); //Hair
        set_color_profile_slot( 14, 4, 201, 228, 242 ); //Shoe/Shirt Light
        set_color_profile_slot( 14, 5, 113, 113, 156 ); //Shoe/Shirt Dark
        set_color_profile_slot( 14, 6, 237, 148, 165 ); //Stem
        set_color_profile_slot( 14, 7, 237, 148, 165 ); //Leaves

        // Giik
        set_color_profile_slot( 15, 0, 254, 254, 254 ); //Jacket
        set_color_profile_slot( 15, 1, 59, 37, 47 ); //Skin/Pot
        set_color_profile_slot( 15, 2, 253, 220, 153 ); //Pants
        set_color_profile_slot( 15, 3, 253, 220, 153 ); //Hair
        set_color_profile_slot( 15, 4, 80, 56, 55 ); //Shoe/Shirt Light
        set_color_profile_slot( 15, 5, 59, 37, 47 ); //Shoe/Shirt Dark
        set_color_profile_slot( 15, 6, 254, 254, 254 ); //Stem
        set_color_profile_slot( 15, 7, 253, 220, 153 ); //Leaves
    } else if(row == 1){
        // Obama and Wireframe are handled in init_shader.gml
        // Ellie
        set_color_profile_slot( 2, 0, 186, 235, 254 ); //Jacket
        set_color_profile_slot( 2, 1, 217, 176, 100 ); //Skin/Pot
        set_color_profile_slot( 2, 2, 53, 115, 183 ); //Pants
        set_color_profile_slot( 2, 3, 249, 244, 153 ); //Hair
        set_color_profile_slot( 2, 4, 248, 248, 248 ); //Shoe/Shirt Light
        set_color_profile_slot( 2, 5, 216, 220, 222 ); //Shoe/Shirt Dark
        set_color_profile_slot( 2, 6, 31, 31, 31 ); //Stem
        set_color_profile_slot( 2, 7, 120, 231, 243 ); //Leaves

        // Adam Carra
        set_color_profile_slot( 3, 0, 75, 75, 75 ); //Jacket
        set_color_profile_slot( 3, 1, 216, 155, 141 ); //Skin/Pot
        set_color_profile_slot( 3, 2, 255, 243, 23 ); //Pants
        set_color_profile_slot( 3, 3, 51, 44, 41 ); //Hair
        set_color_profile_slot( 3, 4, 255, 255, 255 ); //Shoe/Shirt Light
        set_color_profile_slot( 3, 5, 222, 222, 222 ); //Shoe/Shirt Dark
        set_color_profile_slot( 3, 6, 44, 43, 43 ); //Stem
        set_color_profile_slot( 3, 7, 191, 164, 19 ); //Leaves

        // Junior High
        set_color_profile_slot( 4, 0, 55, 97, 149 ); //Jacket
        set_color_profile_slot( 4, 1, 216, 155, 141 ); //Skin/Pot
        set_color_profile_slot( 4, 2, 197, 166, 126 ); //Pants
        set_color_profile_slot( 4, 3, 51, 44, 41 ); //Hair
        set_color_profile_slot( 4, 4, 224, 222, 220 ); //Shoe/Shirt Light
        set_color_profile_slot( 4, 5, 191, 178, 181 ); //Shoe/Shirt Dark
        set_color_profile_slot( 4, 6, 187, 230, 231 ); //Stem
        set_color_profile_slot( 4, 7, 155, 170, 235 ); //Leaves

        // Zircon
        set_color_profile_slot( 5, 0, 1, 229, 255 ); //Jacket
        set_color_profile_slot( 5, 1, 209, 94, 60 ); //Skin/Pot
        set_color_profile_slot( 5, 2, 1, 229, 255 ); //Pants
        set_color_profile_slot( 5, 3, 249, 246, 240 ); //Hair
        set_color_profile_slot( 5, 4, 249, 246, 240 ); //Shoe/Shirt Light
        set_color_profile_slot( 5, 5, 224, 211, 193 ); //Shoe/Shirt Dark
        set_color_profile_slot( 5, 6, 129, 39, 39 ); //Stem
        set_color_profile_slot( 5, 7, 1, 229, 255 ); //Leaves

        // Sakurai
        set_color_profile_slot( 6, 0, 53, 53, 53 ); //Jacket
        set_color_profile_slot( 6, 1, 215, 142, 103 ); //Skin/Pot
        set_color_profile_slot( 6, 2, 27, 22, 37 ); //Pants
        set_color_profile_slot( 6, 3, 85, 49, 42 ); //Hair
        set_color_profile_slot( 6, 4, 111, 46, 46 ); //Shoe/Shirt Light
        set_color_profile_slot( 6, 5, 75, 31, 31 ); //Shoe/Shirt Dark
        set_color_profile_slot( 6, 6, 111, 46, 46 ); //Stem
        set_color_profile_slot( 6, 7, 53, 53, 53 ); //Leaves

        // Lucy
        set_color_profile_slot( 7, 0, 67, 58, 54 ); //Jacket
        set_color_profile_slot( 7, 1, 211, 176, 146 ); //Skin/Pot
        set_color_profile_slot( 7, 2, 95, 20, 45 ); //Pants
        set_color_profile_slot( 7, 3, 221, 179, 145 ); //Hair
        set_color_profile_slot( 7, 4, 240, 242, 244 ); //Shoe/Shirt Light
        set_color_profile_slot( 7, 5, 175, 188, 210 ); //Shoe/Shirt Dark
        set_color_profile_slot( 7, 6, 95, 20, 45 ); //Stem
        set_color_profile_slot( 7, 7, 240, 242, 244 ); //Leaves

        // Starfy
        set_color_profile_slot( 8, 0, 227, 107, 132 ); //Jacket
        set_color_profile_slot( 8, 1, 243, 191, 29 ); //Skin/Pot
        set_color_profile_slot( 8, 2, 255, 239, 67 ); //Pants
        set_color_profile_slot( 8, 3, 243, 191, 29 ); //Hair
        set_color_profile_slot( 8, 4, 255, 239, 67 ); //Shoe/Shirt Light
        set_color_profile_slot( 8, 5, 243, 191, 29 ); //Shoe/Shirt Dark
        set_color_profile_slot( 8, 6, 227, 107, 132 ); //Stem
        set_color_profile_slot( 8, 7, 117, 217, 255 ); //Leaves

        // Yes, Indeed
        set_color_profile_slot( 9, 0, 75, 71, 64 ); //Jacket
        set_color_profile_slot( 9, 1, 164, 123, 91 ); //Skin/Pot
        set_color_profile_slot( 9, 2, 146, 129, 116 ); //Pants
        set_color_profile_slot( 9, 3, 51, 44, 41 ); //Hair
        set_color_profile_slot( 9, 4, 227, 193, 169 ); //Shoe/Shirt Light
        set_color_profile_slot( 9, 5, 164, 123, 91 ); //Shoe/Shirt Dark
        set_color_profile_slot( 9, 6, 57, 54, 47 ); //Stem
        set_color_profile_slot( 9, 7, 227, 193, 169 ); //Leaves

        // Smolburn
        set_color_profile_slot( 10, 0, 122, 90, 78 ); //Jacket
        set_color_profile_slot( 10, 1, 175, 126, 62 ); //Skin/Pot
        set_color_profile_slot( 10, 2, 122, 92, 80 ); //Pants
        set_color_profile_slot( 10, 3, 255, 124, 0 ); //Hair
        set_color_profile_slot( 10, 4, 220, 203, 105 ); //Shoe/Shirt Light
        set_color_profile_slot( 10, 5, 175, 126, 62 ); //Shoe/Shirt Dark
        set_color_profile_slot( 10, 6, 255, 124, 0 ); //Stem
        set_color_profile_slot( 10, 7, 255, 228, 0 ); //Leaves

        // Minicane
        set_color_profile_slot( 11, 0, 59, 73, 135 ); //Jacket
        set_color_profile_slot( 11, 1, 130, 173, 177 ); //Skin/Pot
        set_color_profile_slot( 11, 2, 59, 73, 135 ); //Pants
        set_color_profile_slot( 11, 3, 59, 73, 135 ); //Hair
        set_color_profile_slot( 11, 4, 205, 247, 247 ); //Shoe/Shirt Light
        set_color_profile_slot( 11, 5, 130, 173, 177 ); //Shoe/Shirt Dark
        set_color_profile_slot( 11, 6, 59, 73, 135 ); //Stem
        set_color_profile_slot( 11, 7, 130, 173, 177 ); //Leaves

        // Wrastiny
        set_color_profile_slot( 12, 0, 97, 68, 96 ); //Jacket
        set_color_profile_slot( 12, 1, 129, 60, 116 ); //Skin/Pot
        set_color_profile_slot( 12, 2, 230, 218, 25 ); //Pants
        set_color_profile_slot( 12, 3, 97, 68, 96 ); //Hair
        set_color_profile_slot( 12, 4, 246, 173, 197 ); //Shoe/Shirt Light
        set_color_profile_slot( 12, 5, 210, 135, 180 ); //Shoe/Shirt Dark
        set_color_profile_slot( 12, 6, 182, 182, 182 ); //Stem
        set_color_profile_slot( 12, 7, 141, 231, 255 ); //Leaves

        // MunchKragg
        set_color_profile_slot( 13, 0, 187, 155, 143 ); //Jacket
        set_color_profile_slot( 13, 1, 79, 122, 62 ); //Skin/Pot
        set_color_profile_slot( 13, 2, 79, 122, 62 ); //Pants
        set_color_profile_slot( 13, 3, 187, 155, 143 ); //Hair
        set_color_profile_slot( 13, 4, 213, 216, 221 ); //Shoe/Shirt Light
        set_color_profile_slot( 13, 5, 139, 149, 167 ); //Shoe/Shirt Dark
        set_color_profile_slot( 13, 6, 213, 216, 221 ); //Stem
        set_color_profile_slot( 13, 7, 137, 105, 93 ); //Leaves

        // Buch
        set_color_profile_slot( 14, 0, 39, 92, 171 ); //Jacket
        set_color_profile_slot( 14, 1, 200, 200, 240 ); //Skin/Pot
        set_color_profile_slot( 14, 2, 130, 56, 64 ); //Pants
        set_color_profile_slot( 14, 3, 107, 126, 146 ); //Hair
        set_color_profile_slot( 14, 4, 220, 203, 105 ); //Shoe/Shirt Light
        set_color_profile_slot( 14, 5, 200, 126, 30 ); //Shoe/Shirt Dark
        set_color_profile_slot( 14, 6, 107, 126, 146 ); //Stem
        set_color_profile_slot( 14, 7, 59, 73, 135 ); //Leaves

        // Feri (anti flicker precaution in init_shader.gml)
        set_color_profile_slot( 15, 0, 17, 126, 23 ); //Jacket
        set_color_profile_slot( 15, 1, 169, 71, 225 ); //Skin/Pot
        set_color_profile_slot( 15, 2, 43, 51, 203 ); //Pants
        set_color_profile_slot( 15, 3, 75, 10, 240 ); //Hair
        set_color_profile_slot( 15, 4, 168, 19, 19 ); //Shoe/Shirt Light
        set_color_profile_slot( 15, 5, 168, 19, 19 ); //Shoe/Shirt Dark
        set_color_profile_slot( 15, 6, 17, 126, 23 ); //Stem
        set_color_profile_slot( 15, 7, 255, 48, 224 ); //Leaves
    }
    rowAltsSet = true;
}

//Alt name init. var doesn't work with arrays lol

alt_name[0]  = "Default";
alt_name[1]  = "Hime";
alt_name[2]  = "Liz";
alt_name[3]  = "Acid Rainbows";
alt_name[4]  = "Donyoku";
alt_name[5]  = "Pomme";
alt_name[6]  = "Abyss";
alt_name[7]  = "Early Access";
alt_name[8]  = "Contest";
alt_name[9]  = "Sans";
alt_name[10]  = "Contest";
alt_name[11]  = "Contest";
alt_name[12]  = "Voidfox";
alt_name[13]  = "Classic";
alt_name[14]  = "Kris";
alt_name[15]  = "Giik";
alt_name[16]  = "Obama";
alt_name[17]  = "Wireframe";
alt_name[18]  = "Ellie";
alt_name[19]  = "Adam Carra";
alt_name[20]  = "Junior High";
alt_name[21]  = "Zircon";
alt_name[22]  = "Sakurai";
alt_name[23]  = "Lucy";
alt_name[24]  = "Starfy";
alt_name[25]  = "Yes, Indeed";
alt_name[26]  = "Smolburn";
alt_name[27]  = "Minicane";
alt_name[28]  = "Wrastiny";
alt_name[29]  = "MunchKragg";
alt_name[30]  = "Buch";
alt_name[31]  = "Feri";




//Patch

draw_set_halign(fa_left);

textDraw(temp_x + 2, temp_y + 30, "medFont", c_white, 0, 1000, 1, true, 1, "VER. " + patch_ver);

textDraw(temp_x + 2, temp_y + 50, "fName", c_white, 0, 1000, 1, true, 1, patch_day + " " + patch_month);



//Alt

rectDraw(temp_x, temp_y + 135, temp_x + 201, temp_y + 142, c_black);

for(var i = 0; i < NUM_ROWS; i++){
    for(var j = 0; j < num_alts; j++){
        var draw_color = (j == alt_cur && i == (NUM_ROWS-row-1)) ? c_white : c_gray;
        var draw_x = temp_x + 2 + 10 * j;
        rectDraw(draw_x, temp_y + 137 - 5*i, draw_x + 7, temp_y + 140 - 5*i, draw_color);
    }
}

draw_set_halign(fa_left);

//include alt. name
var alt_num = alt_cur + 16*row;
textDraw(temp_x + 2, temp_y + 124 - 5*(NUM_ROWS-1), "fName", c_white, 0, 1000, 1, true, 1, "Alt. " + (alt_num < 9 ? "0" : "") + string(alt_num+1) + ": " + alt_name[alt_num]);


#define textDraw(x, y, font, color, lineb, linew, scale, outline, alpha, string)

draw_set_font(asset_get(argument[2]));

if argument[7]{ //outline. doesn't work lol
    for (i = -1; i < 2; i++){
        for (j = -1; j < 2; j++){
            draw_text_ext_transformed_color(argument[0] + i * 2, argument[1] + j * 2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, c_black, c_black, c_black, c_black, 1);
        }
    }
}

draw_text_ext_transformed_color(argument[0], argument[1], argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[3], argument[3], argument[3], argument[3], argument[8]);

return string_width_ext(argument[9], argument[4], argument[5]);



#define rectDraw(x1, y1, x2, y2, color)

draw_rectangle_color(argument[0], argument[1], argument[2], argument[3], argument[4], argument[4], argument[4], argument[4], false);