// draw hud

if(batitPlaced){
    draw_sprite(batitBarSprite, 0, temp_x+30, temp_y-10);
    draw_sprite_ext(batitHpSprite, 0, temp_x+34, temp_y-8, batitArticle.batitHealth, 1, 0, -1, 1);
}

draw_sprite_ext(toggleIconSprite, 0, temp_x+70, temp_y+10, 1, 1, 0, !projectilesMandatory ? -1 : c_gray, 1);
draw_sprite_ext(toggleIconSprite, 0, temp_x+70, temp_y+20, 1, 1, 0, !strongsMandatory ? -1 : c_gray, 1);
draw_sprite_ext(toggleIconSprite, 0, temp_x+70, temp_y+30, 1, 1, 0, !autoNudge ? -1 : c_gray, 1);

shader_start();
if(batitDelay < 0){
    draw_sprite_ext(batitIconSprite, 0, temp_x+200, temp_y, 1, 1, 0, -1, 1);
} else {
    draw_sprite_ext(batitIconSprite, 0, temp_x+200, temp_y, 1, 1, 0, c_gray, 1);
}
shader_end();

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