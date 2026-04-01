//calculate percentage of hp
hp_percentage = hp / 1000;
if (hp <= 0) {
	audio_stop_all();
	audio_play_sound(soundMenu, 0, true);
	with (oFadeBox) {
		win_credits = true;
	}
}

//animation for boss hit
if (oBoss.boss_hit) {
	hp -= 25;
	image_index--;
	health_bar_bop = true;
	oBoss.boss_hit = false;
}

//health bar "inflicted" animation
if (health_bar_bop) {
	y += 50 / room_speed;
	if (y > original_y + 5) {
		y = original_y + 5;
		health_bar_bop = false;
		health_bar_back = true;
	}
}

//return back to normal state
if (health_bar_back && !health_bar_bop) {
	y -= 15 / room_speed;
	if (y < original_y) {
		y = original_y;
		health_bar_back = false;
	}
}

//heart fade in
if (global.boss_prep) {
	image_alpha += 1 / (room_speed * 3);
	if (image_alpha > 1) {
		image_alpha = 1;
	}
}



