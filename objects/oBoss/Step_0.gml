//charge up before blaze dash
if (prepare_1) {
	direction = 270; 
	speed = 2 - n; 
	n += 1 / 56;
	if (speed < 0) {
		speed = 0;
		n = 0;
		oBlazeDashWarning.warning_fade = true;
		prepare_1 = false;
	}
}

//attack move + bomba
if (attack_1 && !attack_1_pause && blaze_counter < 8) {
	//speed of boss
	speed = 50;
	
	//control back and forth direction
	if (forward_bomba) {
		if (blaze_counter < 7) {
			if (g == 0) {
				x += ((room_width / 2) - 32) / 4;
			}
			if (g == 1) {
				x -= ((room_width / 2) - 32) / 4;
			}
		}
		deg = radtodeg(arctan2((room_height / 2) - pos_y1, (room_width / 2) - x));
		direction = 360 - deg;
		blaze_counter++;
		forward_bomba = false;
	} 
	if (backward_bomba) {
		direction += 180;
		blaze_counter++;
		backward_bomba = false;
	}
	
	instance_create_layer(x, y, "Instances", oFireTrail);

	if (y < pos_y1) {
		forward_bomba = true;
		alarm[2] = room_speed * (0.15 - 0.075 * (1 - oBossHealth.hp_percentage));
		speed = 0;
		if (blaze_counter > 7) {
			var point_x = room_width / 2;
			var point_y = 128;
			deg = point_direction(x, y, point_x, point_y);
		}
		attack_1_pause = true;
	}
	if (y > pos_y2) {
		backward_bomba = true;
		alarm[2] = room_speed * (0.15 - 0.075 * (1 - oBossHealth.hp_percentage));
		speed = 0;
		attack_1_pause = true;
	}
}
else if (blaze_counter > 7) {
	direction = deg;
	speed = 2 - n;
	n += 1 / 90;
	if (y > 128) {
		x = room_width / 2;
		y = 128;
		speed = 0;
		direction = 0;
		deg = 0;
		n = 0;
		blaze_counter = 0;
		forward_bomba = false;
		backward_bomba = false;
		if (oBossHealth.hp_percentage <= 0.5) {
			alarm[0] = room_speed;
		}
		else {
			alarm[0] = room_speed * 2;
		}
		attack_1 = false;
		attack_1_pause = false;
	}
}

//attack spray lava 
if (attack_2 && active_2) {
	with (oLavaPuddleControl) {
		lava_surge = true;
	}
	show_debug_message("attack_2 = " + string(attack_2));
	if (oBossHealth.hp_percentage <= 0.5) {
		alarm[4] = room_speed * 0.8;
	}
	else {
		alarm[4] = room_speed;
	}
	attack_2 = false;
}

//first section of equilateral triangle movement
if (triangle_move_1) {
	direction = 240;
	speed = 5;
	if (y >= room_height - 128) {
		tri_counter++;
		triangle_move_1 = false;
		triangle_move_2 = true;
	}
}

//second section of equilateral triangle movement
if (triangle_move_2) {
	direction = 0;
	speed = 5;
	if (x >= 336 + (224 / sqrt(3))) {
		tri_counter++;
		if (tri_counter >= 8) {
			tri_slow_down = true;
			tri_counter = 0;
			triangle_move_2 = false;
		}
		else {
			triangle_move_2 = false;
			triangle_move_3 = true;
		}
	}
}

//third section of equilateral triangle movement
if (triangle_move_3) {
	direction = 120;
	speed = 5;
	if (y <= 128) {
		tri_counter++;
		triangle_move_3 = false;
		triangle_move_1 = true;
	}
}

//slow down back to original position
if (tri_slow_down) {
	direction = 120;
	speed = 5 - v;
	v += (25 * sqrt(3)) / 896;
	if (speed < 0) {
		speed = 0;
		v = 0;
		x = room_width / 2;
		y = 128;
		tri_slow_down = false;
	}
}

//edge blast
if (attack_3) {
	if (oSideWarning.r == 1) { //top --> down
		var c = irandom_range(0, 1);
		if (c == 0) {
			for (var i = 0; i < 12; i++) {
				var pos1 = 56 * i;
				var pos2 = 0;
				var b = instance_create_layer(pos1, pos2, "Instances", oCanon);
				b.depth = 0;
				b.num = 0;
				b.canon_id = i;
				b.image_alpha = 0;
				b.alarm[0] = room_speed;
			}
		}
		if (c == 1) {
			for (var i = 0; i < 12; i++) {
				var pos1 = 616 - 56 * i;
				var pos2 = 0;
				var b = instance_create_layer(pos1, pos2, "Instances", oCanon);
				b.depth = 0;
				b.num = 0;
				b.canon_id = i;
				b.image_alpha = 0;
				b.alarm[0] = room_speed;
			}
		}
	}
	if (oSideWarning.r == 0) { //down --> up
		var c = irandom_range(0, 1);
		if (c == 0) {
			for (var i = 0; i < 12; i++) {
				var pos1 = 56 * i;
				var pos2 = room_height - 64;
				var b = instance_create_layer(pos1, pos2, "Instances", oCanon);
				b.depth = 0;
				b.num = 1;
				b.canon_id = i;
				b.image_alpha = 0;
				b.alarm[0] = room_speed;
			}
		}
		if (c == 1) {
			for (var i = 0; i < 12; i++) {
				var pos1 = 616 - 56 * i;
				var pos2 = room_height - 64;
				var b = instance_create_layer(pos1, pos2, "Instances", oCanon);
				b.depth = 0;
				b.num = 1;
				b.canon_id = i;
				b.image_alpha = 0;
				b.alarm[0] = room_speed;
			}
		}
	}
	if (oBossHealth.hp_percentage <= 0.5) {
		alarm[0] = room_speed * 5;
	}
	else {
		alarm[0] = room_speed * 6;
	}
	attack_3 = false;
}

if (boss_slide) {
	direction = 270; 
	speed = (448 / room_speed) - q; 
	q += (448 / power(room_speed, 2));
	if (speed < 0) {
		speed = 0;
		q = 0;
		boss_slide = false;
	}
}

if (boss_slide_back) {
	direction = 90; 
	speed = (448 / room_speed) - q; 
	q += (448 / power(room_speed, 2));
	if (speed < 0) {
		speed = 0;
		q = 0;
		boss_slide_back = false;
	}
}



