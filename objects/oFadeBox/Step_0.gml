//check which room to fade into
if (win_credits) {
	room_goto(rWinAndCredits);
	win_credits = false;
}
if (fade_out) {
	global.fading = true;
	fade_alpha += 2 / room_speed;
	if (fade_alpha > 1) {
		fade_alpha = 1;
		if (change_1_1_2) {
			room_goto(rLvl1_1_2);
			change_1_1_2 = false;
		}
		if (change_1_1_1) {
			room_goto(rLvl1_1_1);
			change_1_1_1 = false;
		}
		if (change_1_2) {
			room_goto(rLvl1_2);
			change_1_2 = false;
		}
		if (change_2_1) {
			room_goto(rLvl2_1);
			change_2_1 = false;
		}
		if (change_2_2) {
			room_goto(rLvl2_2);
			change_2_2 = false;
		}
		if (change_3_1) {
			room_goto(rLvl3_1);
			change_3_1 = false;
		}
		if (change_3_2) {
			room_goto(rLvl3_2);
			change_3_2 = false;
		}
		if (change_4_1) {
			room_goto(rLvl4_1);
			change_4_1 = false;
		}
		if (change_4_2) {
			room_goto(rLvl4_2);
			change_4_2 = false;
		}
		if (change_5_1) {
			room_goto(rLvl5_1);
			change_5_1 = false;
		}
		if (change_5_2) {
			room_goto(rLvl5_2);
			change_5_2 = false;
		}
		if (change_6_1) {
			room_goto(rLvl6_1);
			change_6_1 = false;
		}
		if (change_6_2) {
			room_goto(rLvl6_2);
			change_6_2 = false;
		}
		if (change_7_1) {
			room_goto(rLvl7_1);
			change_7_1 = false;
		}
		if (change_7_2) {
			room_goto(rLvl7_2);
			change_7_2 = false;
		}
		if (change_8_1) {
			room_goto(rLvl8_1);
			change_8_1 = false;
		}
		if (change_8_1_2) {
			room_goto(rLvl8_1_2);
			change_8_1_2 = false;
		}
		if (change_8_2) {
			room_goto(rLvl8_2);
			change_8_2 = false;
		}
		if (change_8_2_2) {
			room_goto(rLvl8_2_2);
			change_8_2_2 = false;
		}
		if (change_9_1) {
			room_goto(rLvl9_1);
			change_9_1 = false;
		}
		if (change_boss) {
			room_goto(rLvlBoss);
			change_boss = false;
		}
		if (change_lvl_screen) {
			room_goto(rLevelsScreen);
			change_lvl_screen = false;
			global.lvl_win = false;
		}
		fade_out = false;
		fade_in = true;
	}
}

//unfade
if (fade_in && !win_credits) {
	fade_alpha -= 2 / room_speed;
	if (fade_alpha < 0) {
		fade_alpha = 0;
		fade_in = false;
		global.fading = false;
	}
}

if (fade_in_intro) {
	fade_alpha -= 1 / room_speed;
	if (fade_alpha < 0) {
		fade_alpha = 0;
		fade_in_intro = false;
		global.fading = false;
	}
}

if (fade_out_intro) {
	global.fading = true;
	fade_alpha += 1 / room_speed;
	if (fade_alpha > 1) {
		fade_alpha = 1;
		room_goto(rStartScreen);
		fade_out_intro = false;
		fade_in_intro = true;
	}
}





