//draw hud

if(batitPlaced){
    draw_sprite(batitBarSprite, 0, temp_x+30, temp_y-10);
    draw_sprite_ext(batitHpSprite, 0, temp_x+34, temp_y-8, batitArticle.batitHealth, 1, 0, -1, 1);
}

if(batitDelay < 0){
    draw_sprite_ext(batitIconSprite, 0, temp_x+200, temp_y, 1, 1, 0, -1, 1);
} else {
    draw_sprite_ext(batitIconSprite, 0, temp_x+200, temp_y, 1, 1, 0, c_gray, 1);
}