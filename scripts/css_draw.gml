// Muno's CSS template
var temp_x = x + 8;
var temp_y = y + 9;

#macro PATCH_VER "3"
#macro PATCH_DAY "18"
#macro PATCH_MONTH "JUNE"

var alt_cur = sprite_get_bbox_left(sprite_get("dog"));


//Alt name init. var doesn't work with arrays lol

alt_name[0]  = "Default";
alt_name[1]  = "Hime";
alt_name[2]  = "Liz";
alt_name[3]  = "Acid Rainbows";
alt_name[4]  = "Donyoku";
alt_name[5]  = "Pomme";
alt_name[6]  = "Abyss";
alt_name[7]  = "Early Access";
alt_name[8]  = "Contest One";
alt_name[9]  = "Sans";
alt_name[10]  = "Contest Three";
alt_name[11]  = "Contest Four";
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

textDraw(temp_x + 2, temp_y + 30, "medFont", c_white, 0, 1000, 1, true, 1, "VER. " + PATCH_VER);

textDraw(temp_x + 2, temp_y + 50, "fName", c_white, 0, 1000, 1, true, 1, PATCH_DAY + " " + PATCH_MONTH);



//Alt

rectDraw(temp_x, temp_y + 135, temp_x + 201, temp_y + 142, c_black);

for(var i = 0; i < ceil(array_length(alt_name)/16); i++){
    for(var j = 0; j < min(array_length(alt_name)-i*16, 16); j++){
        var draw_color = (j+16*i == alt_cur) ? c_white : c_gray;
        var draw_x = temp_x + 2 + 10 * j;
        rectDraw(draw_x, temp_y + 137 - 5*i, draw_x + 7, temp_y + 140 - 5*i, draw_color);
    }
}

draw_set_halign(fa_left);

//include alt. name
textDraw(temp_x + 2, temp_y + 124 - 5*(ceil(array_length(alt_name)/16)-1), "fName", c_white, 0, 1000, 1, true, 1, "Alt. " + (alt_cur < 9 ? "0" : "") + string(alt_cur+1) + ": " + alt_name[alt_cur]);


#define textDraw(x, y, font, color, lineb, linew, scale, outline, alpha, string)

draw_set_font(asset_get(argument[2]));

if argument[7]{ //outline. doesn't work lol
    for (var i = -1; i < 2; i++){
        for (var j = -1; j < 2; j++){
            draw_text_ext_transformed_color(argument[0] + i * 2, argument[1] + j * 2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, c_black, c_black, c_black, c_black, 1);
        }
    }
}

draw_text_ext_transformed_color(argument[0], argument[1], argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[3], argument[3], argument[3], argument[3], argument[8]);

return string_width_ext(argument[9], argument[4], argument[5]);



#define rectDraw(x1, y1, x2, y2, color)

draw_rectangle_color(argument[0], argument[1], argument[2], argument[3], argument[4], argument[4], argument[4], argument[4], false);