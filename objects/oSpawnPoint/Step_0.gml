//kill spawn spot on spike
var spawn_death = tilemap_get_at_pixel(death_tiles, x, y);
if (spawn_death != 0) {
	oSpawnDeath.spawn_killed = true;
	global.is_dead = group_id;
	with (oSpawnKillTutorial) {
		if (!trigger) {
			trigger = true;
		}
	}
}




