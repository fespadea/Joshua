// css draw

// This is an edit of Muno's CSS template: https://pastebin.com/uquifNY8
var temp_x = x + 8; // the base x position
var temp_y = y + 9; // the base y position

// This offsets the alt name stuff when on the online CSS so that the picture thing doesn't cover it up. Set this to 0 if you don't like it. [Edit optional]
var bottomPartOffset = onlineCSS ? -10 : 0;

rectDraw(temp_x, temp_y + 135, temp_x + 201, temp_y + 142, c_black);


for(var i = 0; i < ceil(array_length(altName)/16); i++){ // draw the rectangles for every unlimited alt
    for(var j = 0; j < min(array_length(altName)-i*16, 16); j++){
        var draw_color = (j+16*i == unlimitedAlt) ? c_white : c_gray;
        var draw_x = temp_x + 2 + 10 * j;
        rectDraw(draw_x, temp_y + bottomPartOffset + 137 - 5*i, draw_x + 7, temp_y + bottomPartOffset + 140 - 5*i, draw_color);
    }
}

draw_set_halign(fa_left);

//include alt. name
//include extra alts on online CSS (only keep what's in the else statement, offline, if you don't like this) [Edit optional]
// the vertical spave between the alt names when mutliple alts are displayed on the online CSS (change this to 18 if you don't want overlap with characters like 'y', 'g', 'p', 'q', ',', etc.) [Edit optional]
#macro altNameS_Y_OFFSET 14
if(onlineCSS){ // online CSS
    var j = 0;
    for(var i = unlimitedAlt; i < array_length(altName); i += 16){ // loop through the alts in this column and display the names on top of each other
        textDraw(temp_x + 2, temp_y + bottomPartOffset + 124 - j++*altNameS_Y_OFFSET, "fName", c_white, 0, 1000, 1, true, 1, "Alt. " + (i < 9 ? "0" : "") + string(i+1) + ": " + altName[i]);
    }
} else { // offline CSS
    // display the name of the currently selected alt
    textDraw(temp_x + 2, temp_y + bottomPartOffset + 124 - 5*(ceil(array_length(altName)/16)-1), "fName", c_white, 0, 1000, 1, true, 1, "Alt. " + (unlimitedAlt < 9 ? "0" : "") + string(unlimitedAlt+1) + ": " + altName[unlimitedAlt]);
}


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