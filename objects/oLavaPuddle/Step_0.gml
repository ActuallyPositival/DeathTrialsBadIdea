//fire slowly disappears
if (puddle_fade_out) {
	image_alpha -= 1 / (room_speed * 3);
	if (image_alpha < 0) {
		image_alpha = 0;
		instance_destroy();
		puddle_fade_out = false;
	}
}

if (puddle_fade_in) {
	image_alpha += 1 / (room_speed);
	if (image_alpha > 1) {
		image_alpha = 1;
		puddle_fade_in = false;
	}
}



