//fire slowly disappears
if (fire_fade) {
	image_alpha -= 1 / (room_speed * 3);
	if (image_alpha < 0) {
		image_alpha = 0;
		instance_destroy();
		fire_fade = false;
	}
}





