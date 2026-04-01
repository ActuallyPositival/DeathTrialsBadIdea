//boxes or player or spawn point overlap with button
if (place_meeting(x, y, oPlayer) || 
place_meeting(x, y, oPushBoxBlue) ||
place_meeting(x, y, oSpawnPoint)) {
	with (oMatchingButtonsTutorial) {
		if (!trigger) {
			trigger = true;
		}
	}
	r_block_vis_2 = false;
}
else {
	r_block_vis_2 = true;
}

if (place_meeting(x, y, oPushBoxNormal)) {
	var box = instance_place(x, y, oPushBoxNormal);
	box.wrong_button = true;
}
if (place_meeting(x, y, oPushBoxGreen)) {
	var box = instance_place(x, y, oPushBoxGreen);
	box.wrong_button = true;
}


