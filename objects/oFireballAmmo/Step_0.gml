//regenerate fireball ammo
if (num_fireballs < 5 && regenerate) {
	alarm[0] = room_speed * 2;
	regenerate = false;
}

//ammo fade in
if (global.boss_prep) {
	ammo_alpha += 1 / (room_speed * 3);
	if (ammo_alpha > 1) {
		ammo_alpha = 1;
	}
}


