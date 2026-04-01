//kill spawn on death
if (spawn_killed) {
	with (oSpawnPoint) {
		var a = -1;
		for (var i = 0; i < array_length(global.spawn_order); i++) {
			if (global.is_dead == global.spawn_order[i]) {
				a = i;
			}
		}
		if (a > -1) {
			array_delete(global.spawn_order, a, 1);
		}
		if (group_id = global.is_dead) {
			instance_destroy();
		}
	}
	//destroy corresponding button
	with (oChangeSpawnButton) {
		if (group_id == global.is_dead) {
			instance_destroy();
		}
	}
	//when spawn is killed, make the last triggered spawn the next main spawn
	if (array_length(global.spawn_order) > 0) {
		var new_spawn = global.spawn_order[array_length(global.spawn_order) - 1];
		show_debug_message(global.spawn_order);
		with (oSpawnPoint) {
			is_main = false;
			if ((group_id == new_spawn)) {
				is_main = true;
			}
		}
	}
	spawn_killed = false;
}




