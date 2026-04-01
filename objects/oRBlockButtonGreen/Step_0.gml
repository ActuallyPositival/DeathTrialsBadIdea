//boxes or player or spawn point overlap with button
if (place_meeting(x, y, oPlayer) || 
place_meeting(x, y, oPushBoxGreen) ||
place_meeting(x, y, oSpawnPoint)) {
	r_block_vis_3 = false;
}
else {
	r_block_vis_3 = true;
}

if (place_meeting(x, y, oPushBoxNormal)) {
	var box = instance_place(x, y, oPushBoxNormal);
	box.wrong_button = true;
}
if (place_meeting(x, y, oPushBoxBlue)) {
	var box = instance_place(x, y, oPushBoxBlue);
	box.wrong_button = true;
}


