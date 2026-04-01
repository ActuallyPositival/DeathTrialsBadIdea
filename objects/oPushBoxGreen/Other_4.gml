//check for different rooms --> different box sprite corresponding to room
if (room == rLvl1_1_1 || 
room == rLvl1_2 || 
room == rLvl2_1 || 
room == rLvl2_2 || 
room == rLvl3_1) {
	num = 0;
}

if (room == rLvl3_2 || 
room == rLvl4_1 || 
room == rLvl4_2) {
	num = 1;
}

if (room == rLvl5_1 || 
room == rLvl5_2 || 
room == rLvl6_1) {
	num = 2;
}

if (room == rLvl6_2 || 
room == rLvl7_1 || 
room == rLvl7_2 || 
room == rLvl8_1 || 
room == rLvl8_2) {
	num = 3;
}

if (room == rLvl9_1 || room == rLvlBoss) {
	num = 4;
}

//set sprite based on room
sprite_index = box_sprites[num];




