// batit article (used some of Muno's template for this)

state = 4;
state_timer = 0;
article_timer = 0;

sprite_index = sprite_get("batit_intro");
image_index = 0;
spr_dir = player_id.spr_dir;
depth = player_id.depth - 1;
uses_shader = true;

can_be_grouunded = true;
ignores_walls = false;

player_id.batitPlaced = true;
hitByDTilt = false;
bumpBox = noone;
batitHealth = 50;
numDamages = 0;
attacksFaced[0] = noone;
knockBackAngle = 0;
knockBackPower = 0;

BOTTOM_BLASTZONE_Y_POS = get_stage_data(SD_Y_POS) + get_stage_data(SD_BOTTOM_BLASTZONE);

sprite[7] = sprite_get("batit_utilt");
sprite[6] = sprite_get("batit_hurt");
sprite[5] = sprite_get("batit_dead");
sprite[4] = sprite_get("batit_intro");
sprite[3] = sprite_get("batit_kicked");
sprite[2] = -1; // no need to change the sprite
sprite[1] = sprite_get("batit_ftilt");
sprite[0] = sprite_get("batit");