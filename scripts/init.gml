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

//frames to play before leaving the wall
wall_frames = 2;

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
autoNudge = true;
canSwitchNudge = true;

// Batit nspecial cooldown
BATIT_NSPECIAL_COOLDOWN = 180;

// parry sfx variables
newParrySound = sound_get("JoshuaParryUse");

//hud sprites
batitIconSprite = sprite_get("batit_icon");
batitBarSprite = sprite_get("Batit_hud_bar");
batitHpSprite = sprite_get("batit_hud_hp");
toggleIconSprite = sprite_get("toggle_icon");

//variable to keep track of current Joshua stats
batitStats = false;

//command grab variable (template)
grabbedid = noone;

//variable to indicate that bomb has been used in the air
noMoreBombs = false;

//fspecial sprites
fspecialBackThrowSprite = sprite_get("fspecial_back_throw");
fspecialBackThrowHurtSprite = sprite_get("fspecial_back_throw_hurt");

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

// practice mode
practiceMode = get_training_cpu_action() != CPU_FIGHT && object_index != oTestPlayer;
//tutorial
currentTutorialPage = 0;
var pageNum = 0;
tutorialPages[pageNum] = "Taunt for tutorial.";
pageNum++;
tutorialPages[pageNum] = "In practice mode only, taunt can be cancelled for the sake of this tutorial. You can go back a page with left+taunt and right 10 pages with right+taunt.";
pageNum++;
tutorialPages[pageNum] = "Joshua's main gimmick is his plant Batit which can be placed with dspecial.";
pageNum++;
tutorialPages[pageNum] = "Batit has 50 health, and has a 10 second cooldown before he can be placed again if he dies. He also has a 5 second cooldown if he falls offstage.";
pageNum++;
tutorialPages[pageNum] = "When placed, Joshua's specials change, and he also loses his fstrong and ustrong.";
pageNum++;
tutorialPages[pageNum] = "Most of Joshua's moves are pretty self-explanatory, so just figure them out yourself. This tutorial will cover more obscure things.";
pageNum++;
tutorialPages[pageNum] = "Let's cover how to control Batit first.";
pageNum++;
tutorialPages[pageNum] = "Batit has 3 main projectiles: nspecial (3 second cooldown), fattack (side+attack), and uattack (up+attack). He also has 2 strongs: fstrong and ustrong.";
pageNum++;
tutorialPages[pageNum] = "These moves can be used at any time, almost entirely desynced from Joshua.";
pageNum++;
tutorialPages[pageNum] = "In order to use fair, uair, bair, ftilt, or utilt without triggering Batit's attacks or strongs, you have to quickly tap the input.";
pageNum++;
tutorialPages[pageNum] = "You have until frame 6 of the move to let go of the input before Batit starts his attack or strong.";
pageNum++;
tutorialPages[pageNum] = "This does mean that Batit will have 6 frames of extra start up in these situations.";
pageNum++;
tutorialPages[pageNum] = "If you're fast, you can just repress the inputs immediately to make Batit attack sooner.";
pageNum++;
tutorialPages[pageNum] = "However, you also have the option to toggle this option, so that Batit always attacks with you (assuming he's able to).";
pageNum++;
tutorialPages[pageNum] = "This is done by pressing taunt+attack for the attacks and taunt+strong for the strongs at any point during a match.";
pageNum++;
tutorialPages[pageNum] = "These two toggles are independent of each other, and their status is indicated by the top two lights on the HUD (attack is top and strong is middle).";
pageNum++;
tutorialPages[pageNum] = "Next, I'll go over some specific interactions that Joshua's moves can have with Batit.";
pageNum++;
tutorialPages[pageNum] = "The most simple is that fspecial picks up Batit. It also functions as a grab (this takes priority over picking up Batit).";
pageNum++;
tutorialPages[pageNum] = "The grab is meant to be used for setting stuff up with Batit (desynced strongs mostly, I think), so it has no throws.";
pageNum++;
tutorialPages[pageNum] = "Next is uspecial. When Joshua is using uspecial and touching Batit, he can press special (or up-special with special stick) to transition into his Batitful uspecial.";
pageNum++;
tutorialPages[pageNum] = "This version of uspecial starts in window 3 (the window where you go up), goes higher, has better knockback scaling on the final hit, and does not end in pratfall.";
pageNum++;
tutorialPages[pageNum] = "If you have Batit with you, you can also drop him midair to use this move for recovery if necessary. You'll be dropping Batit Yoshi-style though.";
pageNum++;
tutorialPages[pageNum] = "The last move is aerial dspecial. Joshua can throw a bomb into Batit for a very good kill move, but be careful as this kills Batit.";
pageNum++;
tutorialPages[pageNum] = "Also, Batit can be healed with Taunt.";
pageNum++;
tutorialPages[pageNum] = "Finally, I want to go over nudging. If Joshua holds shield during any of his attacks (excluding aerial dspecial and fspecial for obvious reasons), Batit will get hit.";
pageNum++;
tutorialPages[pageNum] = "This will put Batit in a state where he is sent flying in a the direction of the hitbox's knockback (some hitboxes get special properties).";
pageNum++;
tutorialPages[pageNum] = "In this state, Batit cannot be damage, and he is surrounded by a hitbox that inherits the properties of the hitbox that hit it.";
pageNum++;
tutorialPages[pageNum] = "Nudge can also be cancelled into any of Batit's attacks, but he loses his invincibility and hitbox.";
pageNum++;
tutorialPages[pageNum] = "Nudging can be toggled as the default, so that you have to hold shield during attacks to not nudge Batit by pressing taunt+shield anytime during a match.";
pageNum++;
tutorialPages[pageNum] = "The state of this toggle is indicated by the bottom light on the HUD.";
pageNum++;
tutorialPages[pageNum] = "That's all probably.";
totalTutorialPages = array_length(tutorialPages) - 1;
//tutorial sprites
tutorialSingleSprite = sprite_get("tutorial_single_line");
tutorialBottomSprite = sprite_get("tutorial_bottom_line");
tutorialTopSprite = sprite_get("tutorial_top_line");
tutorialMiddleSprite = sprite_get("tutorial_middle_line");

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
pencilDrawSound = sound_get("pencilTCO");

// Hikaru Support
Hikaru_Title = "Symbiotic";

// kirby support
kirbyability = 16;
swallowed = 0;

//otto support
otto_bobblehead_sprite = sprite_get("otto_head");
otto_bobblehead_body_sprite = sprite_get("otto_body");

//trummel and alto support
trummelcodecneeded = false;
trummelcodec_id = noone;

//trummel and alto reverse support
//sprites
spr_textbox = sprite_get("textbox");
joshuaCodecSprites[3] = sprite_get("batit_codec");
joshuaCodecSprites[2] = sprite_get("joshua_codec");
joshuaCodecSprites[1] = sprite_get("trummelsprite");
joshuaCodecSprites[0] = sprite_get("altosprite");
//sounds
textBoxAppearSound = sound_get("textappearTAA");
textBoxPageSound = sound_get("textpageTAA");
textBoxLeaveSound = sound_get("textleaveTAA");
//variables
codecOut = false;
startCodec = false;
endCodec = false;
codecTimer = 0;
currentPage = 0;
lastPage = 10;
//reverse codec
var page = 0;

//Page 0
joshuaCodecSpeaker[page] = 0;
joshuaCodecExpression[page] = 1;

joshuaCodecLine[page,1] = "...";
joshuaCodecLine[page,2] = "";
joshuaCodecLine[page,3] = "";
joshuaCodecLine[page,4] = "";
page++; 

//Page 1
joshuaCodecSpeaker[page] = 0;
joshuaCodecExpression[page] = 5;

joshuaCodecLine[page,1] = "WAIT WHAT!?";
joshuaCodecLine[page,2] = "";
joshuaCodecLine[page,3] = "";
joshuaCodecLine[page,4] = "";
page++; 

//Page 2
joshuaCodecSpeaker[page] = 0;
joshuaCodecExpression[page] = 2;

joshuaCodecLine[page,1] = "Trummel, did you press";
joshuaCodecLine[page,2] = "down + taunt?";
joshuaCodecLine[page,3] = "";
joshuaCodecLine[page,4] = "";
page++; 

//Page 3
joshuaCodecSpeaker[page] = 1;
joshuaCodecExpression[page] = 0;

joshuaCodecLine[page,1] = "no";
joshuaCodecLine[page,2] = "";
joshuaCodecLine[page,3] = "";
joshuaCodecLine[page,4] = "";
page++; 

//Page 4
joshuaCodecSpeaker[page] = 2;
joshuaCodecExpression[page] = 0;

joshuaCodecLine[page,1] = "Ummm... we did.";
joshuaCodecLine[page,2] = "";
joshuaCodecLine[page,3] = "";
joshuaCodecLine[page,4] = "";
page++; 

//Page 5
joshuaCodecSpeaker[page] = 0;
joshuaCodecExpression[page] = 4;

joshuaCodecLine[page,1] = "Dude you can't just steal";
joshuaCodecLine[page,2] = "a person's thing to make";
joshuaCodecLine[page,3] = "you cool.";
joshuaCodecLine[page,4] = "";
page++; 

//Page 6
joshuaCodecSpeaker[page] = 2;
joshuaCodecExpression[page] = 0;

joshuaCodecLine[page,1] = "Don't get mad. I even";
joshuaCodecLine[page,2] = "have some reverse";
joshuaCodecLine[page,3] = "compatibility with other";
joshuaCodecLine[page,4] = "characters too.";
page++; 

//Page 7
joshuaCodecSpeaker[page] = 3;
joshuaCodecExpression[page] = 0;

joshuaCodecLine[page,1] = "deal with it. sometimes";
joshuaCodecLine[page,2] = "there are people that";
joshuaCodecLine[page,3] = "copy you because you";
joshuaCodecLine[page,4] = "are awesome.";
page++; 

//Page 8
joshuaCodecSpeaker[page] = 3;
joshuaCodecExpression[page] = 0;

joshuaCodecLine[page,1] = "you cant do any thing";
joshuaCodecLine[page,2] = "about it though, unless";
joshuaCodecLine[page,3] = "you are nintendo.";
joshuaCodecLine[page,4] = "";
page++; 

//Page 9
joshuaCodecSpeaker[page] = 0;
joshuaCodecExpression[page] = 4;

joshuaCodecLine[page,1] = "Fine, but you can't just";
joshuaCodecLine[page,2] = "copy our code like that.";
joshuaCodecLine[page,3] = "";
joshuaCodecLine[page,4] = "";
page++; 

//Page 10
joshuaCodecSpeaker[page] = 1;
joshuaCodecExpression[page] = 0;

joshuaCodecLine[page,1] = "salt is real";
joshuaCodecLine[page,2] = "";
joshuaCodecLine[page,3] = "";
joshuaCodecLine[page,4] = "";
page++;