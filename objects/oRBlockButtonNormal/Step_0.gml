//boxes or player or spawn point overlap with button
if (place_meeting(x, y, oPlayer) || 
place_meeting(x, y, oPushBoxNormal) ||
place_meeting(x, y, oSpawnPoint)) {
	r_block_vis = false;
}
else {
	r_block_vis = true;
}

if (place_meeting(x, y, oPushBoxGreen)) {
	var box = instance_place(x, y, oPushBoxGreen);
	box.wrong_button = true;
}
if (place_meeting(x, y, oPushBoxBlue)) {
	var box = instance_place(x, y, oPushBoxBlue);
	box.wrong_button = true;
}


