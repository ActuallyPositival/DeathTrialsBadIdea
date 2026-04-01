//box_kill_diagram
if (!back) {
	image_alpha = n;
	if (image_alpha < 1) {
		n += 1 / room_speed;
		oDim.dim_alpha += 0.75 / room_speed;
	}
	if (image_alpha > 1) {
		image_alpha = 1;
	}
}
else {
	image_alpha = 1 - n;
	n += 1 / room_speed;
	oDim.dim_alpha -= 0.75 / room_speed;
	if (image_alpha < 0) {
		image_alpha = 0;
		oDim.dim_alpha = 0;
		back = false;
		global.game_pause = false;
		instance_destroy();
	}
}


