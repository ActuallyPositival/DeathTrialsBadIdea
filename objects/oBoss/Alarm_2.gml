//pause between instantaneous attacks in move bomba
attack_1_pause = false;

if (blaze_counter < 7) {
	//move boss in bounds
	if (g == 0) {
		x -= lengthdir_x(50, direction);
		y -= lengthdir_y(50, direction);
	}
	if (g == 1) {
		x += lengthdir_x(50, direction);
		y -= lengthdir_y(50, direction);
	}
}




