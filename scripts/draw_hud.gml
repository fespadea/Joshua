//draw hud

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

//tco reverse support, mostly copied
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
 