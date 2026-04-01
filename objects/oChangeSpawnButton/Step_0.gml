//boxes or player or spawn point overlap with button
if (place_meeting(x, y, oPlayer) || 
place_meeting(x, y, oParentPushBox) ||
place_meeting(x, y, oSpawnPoint)) {
	//will only trigger once per instance
	if (!has_triggered) {
		with (oSpawnButtonTutorial) {
			if (!trigger) {
				trigger = true;
			}
		}
		var target_group = group_id;
		with (oSpawnPoint) {
			is_main = false;
		}
		with (oSpawnPoint) {
			if (group_id == target_group) {
				is_main = true;
				array_push(global.spawn_order, group_id);
				show_debug_message(global.spawn_order);
				other.has_triggered = true;
			}
		}
	}
}
else {
	if (has_triggered) {
		with (oSpawnPoint) {
			is_main = false;
			var a = -1;
			for (var i = 0; i < array_length(global.spawn_order); i++) {
				if (other.group_id == global.spawn_order[i]) {
					a = i;
				}
			}
			if (a > -1) {
				array_delete(global.spawn_order, a, 1);
			}
			show_debug_message(global.spawn_order);
		}
	}
	if (array_length(global.spawn_order) > 0) {
		var target_group = global.spawn_order[array_length(global.spawn_order) - 1];
		with (oSpawnPoint) {
			if (group_id == target_group) {
				is_main = true;
			}
		}
	}
	has_triggered = false;
}

// this comment is here just to see if github needs a line for you to pull it so that you would have it updated




