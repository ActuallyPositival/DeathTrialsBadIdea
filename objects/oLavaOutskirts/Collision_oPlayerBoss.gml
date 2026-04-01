//deduct player hearts if visible
if (visible) {
	if (global.lava_burn && !oPlayerBoss.invincible) {
		oPlayerHearts.num_hearts--;
		alarm[0] = room_speed;
		global.lava_burn = false;
	}
}





