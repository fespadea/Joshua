// batit article

state = 0;
state_timer = 0;
article_timer = 0;
sprite_index = sprite_get("batit");
image_index = 0;
spr_dir = player_id.spr_dir;
can_be_grouunded = true;
ignores_walls = false;
free = false;
player_id.batitPlaced = true;