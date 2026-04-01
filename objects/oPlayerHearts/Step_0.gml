//heart fade in
if (global.boss_prep) {
	heart_alpha += 1 / (room_speed * 3);
	if (heart_alpha > 1) {
		heart_alpha = 1;
	}
}

if (num_hearts <= 0) {
	global.boss_lose = true;
}




