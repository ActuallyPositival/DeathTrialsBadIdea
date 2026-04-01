//keep_across all rooms
persistent = true;

//fade variables
fade_alpha = 1;
fade_out = false;
fade_in = false;

//cannot do anything while fading
global.fading = false;

//intro
audio_play_sound(soundIntroChime, 0, false);
alarm[0] = room_speed * 4.5;
fade_in_intro = true;
fade_out_intro = false;

//all lvls
change_1_1_1 = false;
change_1_1_2 = false;
change_1_2 = false;
change_2_1 = false;
change_2_2 = false;
change_3_1 = false;
change_3_2 = false;
change_4_1 = false;
change_4_2 = false;
change_5_1 = false;
change_5_2 = false;
change_6_1 = false;
change_6_2 = false;
change_7_1 = false;
change_7_2 = false;
change_8_1 = false;
change_8_1_2 = false;
change_8_2 = false;
change_8_2_2 = false;
change_9_1 = false;
change_boss = false;
win_credits = false;

//level screen
change_lvl_screen = false;

//array for all of the rooms
all_lvls = array_create(2);
all_lvls[0] = rLvl1_1_1;
all_lvls[1] = rLvl1_2;

