//choose random attack
var i = irandom_range(0, 2);
if (i == 0) {
	g = irandom_range(0, 1);
	prepare_1 = true;
	a1 = true;
	alarm[3] = room_speed * 2.5;
}
if (i == 1) {
	a2 = true;
	alarm[3] = room_speed;
}
if (i == 2) {
	oSideWarning.side_warn = true;
	oSideWarning.r = irandom_range(0, 1);
	if (oSideWarning.r == 1) {
		boss_slide = true;
		if (oBossHealth.hp_percentage <= 0.5) {
			alarm[6] = room_speed * 4.5;
		}
		else {
			alarm[6] = room_speed * 5;
		}
	}
	alarm[3] = room_speed * 2;
	a3 = true;
}





