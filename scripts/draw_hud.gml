// draw hud

if(batitPlaced){
    if(runeM){
        for(var i = 0; i < array_length(batitArticle); i++){
            draw_sprite(batitBarSprite, 0, temp_x+30, temp_y-10-14*i);
            draw_sprite_ext(batitHpSprite, 0, temp_x+34, temp_y-8-14*i, batitArticle[i].batitHealth, 1, 0, -1, 1);
        }
    } else{
        draw_sprite(batitBarSprite, 0, temp_x+30, temp_y-10);
        draw_sprite_ext(batitHpSprite, 0, temp_x+34, temp_y-8, batitArticle.batitHealth, 1, 0, -1, 1);
    }
}

draw_sprite_ext(toggleIconSprite, 0, temp_x+70, temp_y+10, 1, 1, 0, !projectilesMandatory ? -1 : c_gray, 1);
draw_sprite_ext(toggleIconSprite, 0, temp_x+70, temp_y+20, 1, 1, 0, !strongsMandatory ? -1 : c_gray, 1);
draw_sprite_ext(toggleIconSprite, 0, temp_x+70, temp_y+30, 1, 1, 0, autoNudge ? -1 : c_gray, 1);

shader_start();
if(batitDelay < 0){
    draw_sprite_ext(batitIconSprite, 0, temp_x+200, temp_y, 1, 1, 0, -1, 1);
} else {
    draw_sprite_ext(batitIconSprite, 0, temp_x+200, temp_y, 1, 1, 0, c_gray, 1);
}
shader_end();

// practice mode tips
if(practiceMode){
    var numLines = array_length(parsedLines[currentTutorialPage]);
    if(currentTutorialPage){ //draw the background of the tutorial
        if(numLines == 1){
            draw_sprite(tutorialSingleSprite, 0, temp_x-8, temp_y-24);
        } else {
            draw_sprite(tutorialBottomSprite, 0, temp_x-8, temp_y-20);
            for(var j = 1; j < numLines - 1; j++){
                draw_sprite(tutorialMiddleSprite, 0, temp_x-8, temp_y-24-18*j);
            }
            draw_sprite(tutorialTopSprite, 0, temp_x-8, temp_y-24-18*(numLines-1));
        }
        draw_debug_text(temp_x-2, temp_y-18-18*numLines, string(currentTutorialPage) + "/" + string(totalTutorialPages));
    }
    for(var k = 0; k < numLines; k++){
        draw_debug_text(temp_x, temp_y-2-18*(numLines - k), parsedLines[currentTutorialPage, k]);
    }
}

// tco reverse support, mostly copied
if(drawingTimer){
    if(drawingTimer == 1 || drawingTimer == 179){
        draw_sprite_ext(artPaper, 4, temp_x + 126, temp_y - 81.2, 1, 1, 0, -1, 0.2);
    }
    if(drawingTimer == 2 || drawingTimer == 178){
        draw_sprite_ext(artPaper, 4, temp_x + 126, temp_y - 81.4, 1, 1, 0, -1, 0.4);
    }
    if(drawingTimer == 3 || drawingTimer == 177){
        draw_sprite_ext(artPaper, 4, temp_x + 126, temp_y - 81.6, 1, 1, 0, -1, 0.6);
    }
    if(drawingTimer == 4 || drawingTimer == 176){
        draw_sprite_ext(artPaper, 4, temp_x + 126, temp_y - 81.8, 1, 1, 0, -1, 0.8);
    }
    if(drawingTimer > 4 && drawingTimer < 176){
        draw_sprite_ext(artPaper, 4, temp_x + 126, temp_y - 81.8, 1, 1, 0, -1, 1);
        draw_sprite(artTCO, 0, temp_x + 126, temp_y - 347);
    }
    drawingTimer--;
}

// trummel and alto reverse support 
if(codecOut){
    if(startCodec){
        draw_sprite(spr_textbox, floor(codecTimer/6), temp_x + 102, temp_y - 4);
        if(codecTimer == 47){
            startCodec = false;
            codecTimer = 0;
        }
    } else if(endCodec){
        draw_sprite(spr_textbox, floor(codecTimer/6) + 9, temp_x + 102, temp_y - 4);
        if(codecTimer == 29){
            endCodec = false;
            codecOut = false;
            codecTimer = 0;
        }
    } else {
        draw_sprite(spr_textbox, 8, temp_x + 102, temp_y - 4);
        draw_debug_text(temp_x+14,temp_y-78,string_copy(joshuaCodecLine[currentPage,1], 0, floor(codecTimer/2)));
        draw_debug_text(temp_x+14,temp_y-60,string_copy(joshuaCodecLine[currentPage,2], 0, max(0, floor(codecTimer/2) - string_length(joshuaCodecLine[currentPage,1]))));
        draw_debug_text(temp_x+14,temp_y-42,string_copy(joshuaCodecLine[currentPage,3], 0, max(0, floor(codecTimer/2) - string_length(joshuaCodecLine[currentPage,1]) - string_length(joshuaCodecLine[currentPage,2]))));
        draw_debug_text(temp_x+14,temp_y-24,string_copy(joshuaCodecLine[currentPage,4], 0, max(0, floor(codecTimer/2) - string_length(joshuaCodecLine[currentPage,1]) - string_length(joshuaCodecLine[currentPage,2]) - string_length(joshuaCodecLine[currentPage,3]))));
        var offset = 0;
        if (currentPage+1 >= 10){
            offset = 8;
        }
        var offset2 = 0;
        if (lastPage+1 >= 10){
            offset2 = 8;
        }
        draw_debug_text(temp_x-26-offset-offset2, temp_y-36, (string(currentPage+1) + "/" + string(lastPage+1)));
        draw_sprite(joshuaCodecSprites[joshuaCodecSpeaker[currentPage]], floor(codecTimer/2) < string_length(joshuaCodecLine[currentPage,1]) + string_length(joshuaCodecLine[currentPage,2]) + string_length(joshuaCodecLine[currentPage,3]) + string_length(joshuaCodecLine[currentPage,4]) ? floor(codecTimer/6) % 2 + joshuaCodecExpression[currentPage]*2 : joshuaCodecExpression[currentPage]*2, temp_x - 34, temp_y - 82);
    }
    codecTimer++;
}

//abyss gui code
ab_hud_x = temp_x;
ab_hud_y = temp_y;
//this is for the outdated warning message
if ("depNotice" not in self) depNotice = 0;
if ("abyssEnabled" in self && abyssEnabled && (menuActive || timerActive)) abyssDraw();
#define abyssDraw 
/// abyssDraw()
/// draws text and images the player recieved from the abyss buddy.
if ("abyss_drawArray" in self && ds_list_valid(abyss_drawArray))  {
    if (ds_list_size(abyss_drawArray) > 0) {
        for (var _i = 0; _i < ds_list_size(abyss_drawArray);_i++) {
            var _text = abyss_drawArray[| _i];
            if draw_get_halign() != _text[6] {
                draw_set_halign(_text[6]);
            }
            switch (_text[0]) {
                case 0:
                    draw_debug_text(floor(_text[1]),floor(_text[2]),string(_text[3]));
                    break;
                case 1:
                    draw_sprite_ext(_text[3],_text[5],_text[1],_text[2],1,1,0,_text[4],1);
                    break;
                case 2:
                    draw_text_plus(floor(_text[1]),floor(_text[2]),string(_text[3]),floor(_text[5]),floor(_text[4]));
                    break;
                case 3:
                    if draw_get_font() != 1 draw_set_font(1);
              draw_text_ext_color(floor(_text[1]),floor(_text[2]),string(_text[3]),16,floor(_text[5]),_text[4],_text[4],_text[4],_text[4], 1);
                    break;
                default:
                break;
            }
        }
    }
    //finished drawing, so clear the table for the next frame.
    ds_list_clear(abyss_drawArray);
}
//return draw_calls;
#define draw_text_plus
/// draw_text_plus(x, y, text, font, color = c_white)
/// draws outlined text in any in-game font.
if draw_get_font() != argument[3] {
    draw_set_font(argument[3]);
}
draw_text_color(argument[0]+2,argument[1],argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0]-2,argument[1],argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0],argument[1]-2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0],argument[1]+2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0]+2,argument[1]-2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0]-2,argument[1]-2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0]+2,argument[1]+2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0]-2,argument[1]+2,argument[2],c_black,c_black,c_black,c_black,1);
draw_text_color(argument[0],argument[1],argument[2],argument_count > 4 ? argument[4] : c_white,argument_count > 4 ? argument[4] : c_white,argument_count > 4 ? argument[4] : c_white,argument_count > 4 ? argument[4] : c_white,1);