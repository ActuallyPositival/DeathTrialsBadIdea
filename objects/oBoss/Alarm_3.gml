//activate attack
if (a1) {
	attack_1 = true;
	x = room_width / 2;
	deg = radtodeg(arctan2(pos_y2 - pos_y1, pos_x2 - pos_x1));
	if (g == 0) {
		direction = 360 - deg;
	}
	if (g == 1) {
		direction = 180 + deg;
	}
	a1 = false;
}
if (a2) {
	attack_2 = true;
	active_2 = true;
	triangle_move_1 = true;
	a2 = false;
	if (oBossHealth.hp_percentage <= 0.5) {
		alarm[0] = room_speed * 9;
	}
	else {
		alarm[0] = room_speed * 10;
	}
	alarm[5] = room_speed * 8;
}
if (a3) {
	attack_3 = true;
	oSideWarning.side_warn = false;
	a3 = false;
}





