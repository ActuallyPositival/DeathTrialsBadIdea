if (instance_exists(oPlayerBoss)){
	playerDeadPosX = oPlayerBoss.x;
	playerDeadPosY = oPlayerBoss.y;
}
if (instance_exists(oBoss)){
	bossDeadPosX = oBoss.x;
	bossDeadPosY = oBoss.y;
}
if (room = rLevelsScreen){
	instance_destroy();
}