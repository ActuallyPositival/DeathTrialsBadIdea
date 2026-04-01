//increase alpha
if (oBoss.prepare_1){
	if (oBoss.g == 0 && !displayedWarning) {
		//draw warning area
		displayedWarning = true;
		sprite_index = sBlazeDashWarning2;
		alarm[0] = room_speed*2;
	}
	if (oBoss.g == 1 && !displayedWarning) {
		displayedWarning = true;
		sprite_index = sBlazeDashWarning1;
		alarm[0] = room_speed*2;
	}
}


