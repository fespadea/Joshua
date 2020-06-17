// batit article (used some of Muno's template for this)

state = 4;
state_timer = 0;
article_timer = 0;

sprite_index = sprite_get("batit_intro");
image_index = 0;
spr_dir = player_id.spr_dir;
depth = player_id.depth - 1;
uses_shader = true;

can_be_grounded = true;
ignores_walls = false;

player_id.batitPlaced = true;
attackDir = 1;

//taunt variable
tauntTime = false;

//explode variable
explode = 0;

//health/damage variables
batitHealth = 50;
numDamages = 0;
attacksFaced[0] = noone;
knockBackAngle = 0;
knockBackPower = 0;
hGroupCheck[0,0] = 0;

//nudge variables
hitByDTilt = false;
nudgeAttack = -1;
nudgeDamage = 0;
nudgeAngle = 0;
nudgeBaseKnockback = 0;
nudgeKnockbackScaling = 0;
nudgeUpSprite = sprite_get("batit_kicked_up");
nudgeUpFallSprite = sprite_get("batit_kicked_up_fall");
nudgePrevVsp = 0;
nudgeBounced = false;
nudgeHitboxID = noone;
bumpBox = noone;

//strong variables
window = 0;
window_timer = 0;
window0Length = 0;
window1Length = 0;
window2Length = 0;
strongCharge = 0;
fstrongChargeSprite = sprite_get("batit_fstrong_charge");
ustrongChargeSprite = sprite_get("batit_ustrong_charge");
//fstrong hitboxes
mehBox = noone;
sweetBox = noone;
//ustrong hitbox
attackBox = noone;

//nspecial cooldown variables
showNspecialCooldown = false;
//nspecial cooldown sprites
nspecialCooldownBar = sprite_get("batit_cooldown_bar");
nspecialCooldownCharge = sprite_get("batit_cooldown_charge");

sprite[12] = sprite_get("batit_taunt");
sprite[11] = sprite_get("batit_ustrong");
sprite[10] = sprite_get("batit_fstrong");
sprite[9] = sprite_get("batit_nspecial");
sprite[8] = sprite_get("batit_explode");
sprite[7] = sprite_get("batit_utilt");
sprite[6] = sprite_get("batit_hurt");
sprite[5] = sprite_get("batit_dead");
sprite[4] = sprite_get("batit_intro");
sprite[3] = sprite_get("batit_kicked");
sprite[2] = -1; // no need to change the sprite
sprite[1] = sprite_get("batit_ftilt");
sprite[0] = sprite_get("batit");