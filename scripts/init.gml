hurtbox_spr = sprite_get("hurtbox");
crouchbox_spr = sprite_get("crouchbox");
air_hurtbox_spr = -1;
hitstun_hurtbox_spr = sprite_get("hitstun_hurtbox");

char_height = 50;
idle_anim_speed = .1;
crouch_anim_speed = .1;
walk_anim_speed = .125;
dash_anim_speed = .2;
pratfall_anim_speed = .25;

walk_speed = 3.25;
walk_accel = 0.25;
walk_turn_time = 6;
initial_dash_time = 10;
initial_dash_speed = 7.5;
dash_speed = 7;
dash_turn_time = 10;
dash_turn_accel = 1.75;
dash_stop_time = 4;
dash_stop_percent = .35; //the value to multiply your hsp by when going into idle from dash or dashstop
ground_friction = .6;
moonwalk_accel = 1.4;

jump_start_time = 5;
jump_speed = 10.5;
short_hop_speed = 6;
djump_speed = 10;
leave_ground_max = 7; //the maximum hsp you can have when you go from grounded to aerial without jumping
max_jump_hsp = 6; //the maximum hsp you can have when jumping from the ground
air_max_speed = 5; //the maximum hsp you can accelerate to when in a normal aerial state
jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
air_accel = .3;
prat_fall_accel = .85; //multiplier of air_accel while in pratfall
air_friction = .04;
max_djumps = 1;
double_jump_time = 32; //the number of frames to play the djump animation. Can't be less than 31.
walljump_hsp = 7;
walljump_vsp = 8;
walljump_time = 32;
max_fall = 10; //maximum fall speed without fastfalling
fast_fall = 14; //fast fall speed
gravity_speed = .5;
hitstun_grav = .5;
knockback_adj = 1.1; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier

land_time = 4; //normal landing frames
prat_land_time = 14;
wave_land_time = 8;
wave_land_adj = 1.35; //the multiplier to your initial hsp when wavelanding. Usually greater than 1
wave_friction = .12; //grounded deceleration when wavelanding

//crouch animation frames
crouch_startup_frames = 2;
crouch_active_frames = 1;
crouch_recovery_frames = 2;

//parry animation frames
dodge_startup_frames = 3;
dodge_active_frames = 1;
dodge_recovery_frames = 3;

//tech animation frames
tech_active_frames = 8;
tech_recovery_frames = 1;

//tech roll animation frames
techroll_startup_frames = 2;
techroll_active_frames = 3;
techroll_recovery_frames = 1;
techroll_speed = 9;

//airdodge animation frames
air_dodge_startup_frames = 1;
air_dodge_active_frames = 3;
air_dodge_recovery_frames = 1;
air_dodge_speed = 7.5;

//roll animation frames
roll_forward_startup_frames = 2;
roll_forward_active_frames = 3;
roll_forward_recovery_frames = 1;
roll_back_startup_frames = 2;
roll_back_active_frames = 3;
roll_back_recovery_frames = 1;
roll_forward_max = 10; //roll speed
roll_backward_max = 10;

land_sound = asset_get("sfx_land_med");
landing_lag_sound = asset_get("sfx_land");
waveland_sound = asset_get("sfx_waveland_zet");
jump_sound = asset_get("sfx_jumpground");
djump_sound = asset_get("sfx_jumpair");
air_dodge_sound = asset_get("sfx_quick_dodge");

//visual offsets for when you're in Ranno's bubble
bubble_x = 0;
bubble_y = 8;

// Batit variables
batitPlaced = false;
batitArticle = noone;
batitDied = false;
batitFell = false;
batitDelay = 0;
pickUpBatit = false;

// Dattack variables
finishDattack = false;
initialDattackY = 0;

// Uair variable
finishUair = false;

// Fspecial_2 variable
whipHitPlayer = false;

// Uspecial_2 variable
dontSwitchToUspecial = false;
currentUspecialSprite = -1;
currentUspecialImageIndex = -1;
currentUspecialHurtSprite = -1;

// batit aerial attack variables
doStrong = true;
doAttack = true;
projectilesMandatory = false;
canSwitchProjectiles = true;
strongsMandatory = false;
canSwitchStrongs = true;

// Nudge variables
autoNudge = false;
canSwitchNudge = true;

// variables to prevent turning around with batitless fstrong and ustrong
prevSprDir = spr_dir;
unturn = false;

//hud sprites
batitIconSprite = sprite_get("batit_icon");
batitBarSprite = sprite_get("Batit_hud_bar");
batitHpSprite = sprite_get("batit_hud_hp");
toggleIconSprite = sprite_get("toggle_icon");

//variable to keep track of current Joshua stats
batitStats = false;

//dspecial_2 sprites
dspecial2Sprite = sprite_get("dspecial_2");
dspecial2ChargeSprite = sprite_get("dspecial_2_charge");

//hfx
leafBreakHfx = hit_fx_create(sprite_get("batit_leaf_break"), 25);
leafHitHfx = hit_fx_create(sprite_get("batit_leaf_hfx"), 25);
strongHitHfx = hit_fx_create(sprite_get("batit_strong_hfx"), 30);
set_hit_particle_sprite(1, PART_MAY_LEAF);
set_hit_particle_sprite(2, PART_SYL_FLOWER);

//intro
introTimer = -4;
introTimer2 = 0;
switch(get_player_color(player)){
    case 6:
        introSprite = sprite_get("intro_abyss");
        numIntroFrames = 20;
        break;
    case 7:
        introSprite = sprite_get("intro_ea");
        numIntroFrames = 11;
        break;
    default:
        introSprite = sprite_get("intro");
        numIntroFrames = 7;
}

//tco support
tcoart = sprite_get("tcoart_joshuake");

//feri support
feri_costume = sprite_get("feri_costume_joshua_and_batit");

//reverse support
compatibleUrl = 0;

//tco reverse support
drawingTimer = 0;
artPaper = sprite_get("taunt_tco_paper");
artTCO = sprite_get("taunt_tco_art");

// Hikaru Support
Hikaru_Title = "Symbiotic";

// kirby support
kirbyability = 16;
swallowed = 0;

//otto support
otto_bobblehead_sprite = sprite_get("otto_head");
otto_bobblehead_body_sprite = sprite_get("otto_body");