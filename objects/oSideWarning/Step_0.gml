//flash warning at 1 of 4 spots
if (side_warn) {
	visible = true;
	if (r == 0) {
		x = room_width / 2;
		y = room_height - 64;
	}
	if (r == 1) {
		x = room_width / 2;
		y = 64;
	}
}
else {
	visible = false;
	x = -100;
	y = -100;
}




