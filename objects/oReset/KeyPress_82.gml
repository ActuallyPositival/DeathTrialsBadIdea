//press R in all level rooms --> restart the room
if (room == rLvlBossFight || room == rLvlBoss) {
	with(oFadeBox) {
		fade_out = true;
		change_boss = true;
	}
}
else if (room != rIntroScreen ||
room != rLevelsScreen ||
room != rStartScreen) {
	room_restart();
}




