if (!global.fading) {
	//fade in, stop when fully in
	if (key_fade_in) {
		image_alpha += 2 / room_speed;
		if (image_alpha > 1) {
			image_alpha = 1;
			key_fade_in = false;
		}
	}

	if ((keyboard_check_pressed(vk_left) == 1 ||
	keyboard_check_pressed(vk_right) == 1 ||
	keyboard_check_pressed(vk_up) == 1 ||
	keyboard_check_pressed(vk_down) == 1 ||
	keyboard_check_pressed(ord("W")) == 1 ||
	keyboard_check_pressed(ord("A")) == 1 ||
	keyboard_check_pressed(ord("S")) == 1 ||
	keyboard_check_pressed(ord("D")) == 1) &&
	!stop_loop) {
		key_fade_in = false;
		key_fade_out = true;
		stop_loop = true;
	}

	if (key_fade_out) {
		image_alpha -= 2 / room_speed;
		if (image_alpha < 0) {
			image_alpha = 0;
			key_fade_out = false;
			instance_destroy();
		}
	}
}





