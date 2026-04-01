//take away health
if (global.puddle_burn && !puddle_fade_in) {
	oPlayerHearts.num_hearts--;
	alarm[0] = room_speed;
	global.puddle_burn = false;
}




