//player burned
if (global.burn_damage && !oPlayerBoss.invincible) {
	oPlayerHearts.num_hearts--;
	alarm[1] = room_speed;
	global.burn_damage = false;
}





