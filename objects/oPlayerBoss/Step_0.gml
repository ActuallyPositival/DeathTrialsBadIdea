if (!global.fading && !global.boss_prep && !global.boss_lose) {
	//invincibility
	if (invincible) {
		n -= 0.5 / room_speed;
		if (n < 0) {
			n = 2;
			invincible = false;
		}
	}
	
	//checking which arrow keys are pressed
	if (keyboard_check_direct(vk_left) == 1 || keyboard_check_direct(ord("A")) == 1) {
		x -= 2;
		num = 2;
	}
	if (keyboard_check_direct(vk_right) == 1 || keyboard_check_direct(ord("D")) == 1) {
		x += 2;
		num = 3;
	}
	if (keyboard_check_direct(vk_up) == 1 || keyboard_check_direct(ord("W")) == 1) {
		y -= 2;
		num = 1;
	}
	if (keyboard_check_direct(vk_down) == 1 || keyboard_check_direct(ord("S")) == 1) {
		y += 2;
		num = 0;
	}

	//update player image
	sprite_index = player_sprites[num];
}
else if (global.boss_prep) {
	sprite_index = player_sprites[1];
	spd += a;
	y -= spd;
}
if (y>room_height-32){
	y = room_height-32;
}
if (x>room_width-32){
	x = room_width-32;
}
if (y<0){
	y = 0;
}
if (x<0){
	x = 0;
}


