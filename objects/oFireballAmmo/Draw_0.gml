//ammo alpha
draw_set_alpha(ammo_alpha);

//draw amount of fireball ammos
var first_fireball = room_width - 32;
for (var i = 0; i < num_fireballs; i++) {
	draw_sprite(sFireballAmmo, 0, first_fireball - 48 * i, 32);
}





