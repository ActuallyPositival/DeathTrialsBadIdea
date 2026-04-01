//canon orientation
sprite_index = canon_sprite[num];

//canon fading in
if (canon_fade_in) {
	image_alpha += 1 / room_speed;
	if (image_alpha > 1) {
		image_alpha = 1;
		canon_fade_in = false;
	}
}

if (canon_fade_out) {
	image_alpha -= 4 / room_speed;
	if (image_alpha < 0) {
		image_alpha = 0;
		show_debug_message("fading complete " + string(canon_id));
		canon_fade_out = false;
		instance_destroy();
	}
}


