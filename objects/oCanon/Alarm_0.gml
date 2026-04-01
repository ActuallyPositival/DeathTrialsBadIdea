//canons shoot balls
if (check_id == canon_id) {
	if (y < room_height / 2) {
		var cball = instance_create_layer(x + 29, y + 32, "Instances", oCanonball);
		cball.depth = -1;
		cball.vspeed = 6.5;
	}
	else {
		var cball = instance_create_layer(x + 29, y - 32, "Instances", oCanonball);
		cball.depth = -1;
		cball.vspeed = -6.5;
	}
	canon_fade_out = true;
	show_debug_message("cannon fade out = " + string(canon_fade_out));
}
else {
	check_id++;
	alarm[0] = room_speed * 0.4;
}




