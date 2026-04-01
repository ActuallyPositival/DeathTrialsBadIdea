//when boss uses blaze dash, appear
if (oBoss.a1) {
	x = oBoss.x;
	y = oBoss.y;
	image_alpha += 1 / (room_speed * 4.8);
	if (image_alpha > 0.5) {
		image_alpha = 0.5;
	}
}

if (oBoss.attack_1) {
	x = oBoss.x;
	y = oBoss.y;
}

if (oBoss.blaze_counter > 7) {
	image_alpha -= 1 / (room_speed * 2.4);
	if (image_alpha < 0) {
		image_alpha = 0;
		x = -500;
		y = -500;
	}
}





