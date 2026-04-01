/// @description Draws the Win! screen
if (global.boss_lose && !global.fading) {
	draw_sprite(sLoseScreen, 1, 0, 0);
} else {
	draw_sprite(sLoseScreen, 0, 0, 0);
}





