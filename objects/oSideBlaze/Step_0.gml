//change sprite based on side it comes out from
sprite_index = side_blaze[num];

if (side_blaze_active) {
	 // TOP → down
    if (num == 0) {
        if (y + vy >= 0) {
            y = 0;
            side_blaze_active = false;
            side_blaze_fade = true;
        } else {
            y += vy;
        }
    }

    // BOTTOM → up
    if (num == 1) {
        if (y + vy <= room_height) {
            y = room_height;
            side_blaze_active = false;
            side_blaze_fade = true;
        } else {
            y += vy;
        }
    }

    // LEFT → right
    if (num == 2) {
        if (x + vx >= 0) {
            x = 0;
            side_blaze_active = false;
            side_blaze_fade = true;
        } else {
            x += vx;
        }
    }

    // RIGHT → left
    if (num == 3) {
        if (x + vx <= room_width) {
            x = room_width;
            side_blaze_active = false;
            side_blaze_fade = true;
        } else {
            x += vx;
        }
    }
}

//fade away after reaching point
if (side_blaze_fade) {
	image_alpha -= 1 / room_speed;
	if (image_alpha <= 0) {
		side_blaze_fade = false;
		instance_destroy();
	}
}




