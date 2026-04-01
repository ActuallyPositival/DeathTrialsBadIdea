//transfer to different room once button is pressed
if (place_meeting(x, y, oPlayer) || 
place_meeting(x, y, oParentPushBox) || 
place_meeting(x, y, oSpawnPoint)) {
	with (oFadeBox) {
		fade_out = true;
		change_8_1_2 = true;
	}
}




