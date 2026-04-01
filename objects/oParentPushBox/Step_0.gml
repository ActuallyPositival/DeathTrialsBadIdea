//collision with "death" blocks
var death = tilemap_get_at_pixel(death_tiles, x, y);
if (death != 0 || wrong_button) {
	with (oBoxKillTutorial) {
		if (!trigger) {
			trigger = true;
		}
	}
	if (instance_number(oSpawnPoint) <= 0) {
		instance_destroy();
	}
	else {
		with (oSpawnPoint) {
			if (is_main) {
				other.x = x;
				other.y = y;
			}
		}
		// check spaces
		var wall_top  = tilemap_get_at_pixel(collision_tiles, x, y - 32);
		var wall_top_right = tilemap_get_at_pixel(collision_tiles, x + 32, y - 32);
		var wall_right = tilemap_get_at_pixel(collision_tiles, x + 32, y);
		var wall_bottom_right = tilemap_get_at_pixel(collision_tiles, x + 32, y + 32);
		var wall_bottom = tilemap_get_at_pixel(collision_tiles, x, y + 32);
		var wall_bottom_left = tilemap_get_at_pixel(collision_tiles, x - 32, y + 32);
		var wall_left = tilemap_get_at_pixel(collision_tiles, x - 32, y);
		var wall_top_left = tilemap_get_at_pixel(collision_tiles, x - 32, y - 32);
		var box_top   = place_meeting(x, y - 32, oParentPushBox);
		var box_top_right = place_meeting(x + 32, y - 32, oParentPushBox);
		var box_right = place_meeting(x + 32, y, oParentPushBox);
		var box_bottom_right = place_meeting(x + 32, y + 32, oParentPushBox);
		var box_bottom = place_meeting(x, y + 32, oParentPushBox);
		var box_bottom_left = place_meeting(x - 32, y + 32, oParentPushBox);
		var box_left = place_meeting(x - 32, y, oParentPushBox);
		var box_top_left = place_meeting(x - 32, y - 32, oParentPushBox);
		
		if (wall_top != 0 || box_top) {
			t = true;
		}
		if (wall_top_right != 0 || box_top_right) {
			tr = true;
		}
		if (wall_right != 0 || box_right) {
			r = true;
		}
		if (wall_bottom_right != 0 || box_bottom_right) {
			br = true;
		}
		if (wall_bottom != 0 || box_bottom) {
			b = true;
		}
		if (wall_bottom_left != 0 || box_bottom_left) {
			bl = true;
		}
		if (wall_left != 0 || box_left) {
			l = true;
		}
		if (wall_top_left != 0 || box_top_left) {
			tl = true;
		}
		// choose slide target
		if (t && tr && r && br && b && bl && l && tl) {
			target_x = x;
			target_y = y;
		}
		else if (t && tr && r && br && b && bl && l) {
			target_x = x - 32;
			target_y = y - 32;
			slide_top_left = true;
		}
		else if (t && tr && r && br && b && bl) {
			target_x = x - 32;
			target_y = y;
			slide_left = true;
		}
		else if (t && tr && r && br && b) {
			target_x = x - 32;
			target_y = y + 32;
			slide_bottom_left = true;
		}
		else if (t && tr && r && br) {
			target_x = x;
			target_y = y + 32;
			slide_bottom = true;
		}
		else if (t && tr && r) {
			target_x = x + 32;
			target_y = y + 32;
			slide_bottom_right = true;
		}
		else if (t && tr) {
			target_x = x + 32;
			target_y = y;
			slide_right = true;
		}
		else if (t) {
			target_x = x + 32;
			target_y = y - 32;
			slide_top_right = true;
		}
		else {
			target_x = x;
			target_y = y - 32;
			slide_top = true;
		}
		if (wrong_button) {
			wrong_button = false;
		}
	}
}

//smooth movement on death
if (slide_top) {
	y = lerp(y, target_y, 0.1);
	if (abs(y - target_y) < 0.1) {
		y = target_y;
		slide_top = false;
	}
}
if (slide_top_right) {
	x = lerp(x, target_x, 0.1);
	y = lerp(y, target_y, 0.1);
	if (abs(x - target_x) < 0.1 && abs(y - target_y) < 0.1) {
		x = target_x;
		y = target_y;
		slide_top_right = false;
	}
}
if (slide_right) {
	x = lerp(x, target_x, 0.1);
	if (abs(x - target_x) < 0.1) {
		x = target_x;
		slide_right = false;
	}
}
if (slide_bottom) {
	y = lerp(y, target_y, 0.1);
	if (abs(y - target_y) < 0.1) {
		y = target_y;
		slide_bottom = false;
	}
}
if (slide_left) {
	x = lerp(x, target_x, 0.1);
	if (abs(x - target_x) < 0.1) {
		x = target_x;
		slide_left = false;
	}
}
if (slide_bottom_right) {
	x = lerp(x, target_x, 0.1);
	y = lerp(y, target_y, 0.1);
	if (abs(x - target_x) < 0.1 && abs(y - target_y) < 0.1) {
		x = target_x;
		y = target_y;
		slide_bottom_right = false;
	}
}
if (slide_top_left) {
	x = lerp(x, target_x, 0.1);
	y = lerp(y, target_y, 0.1);
	if (abs(x - target_x) < 0.1 && abs(y - target_y) < 0.1) {
		x = target_x;
		y = target_y;
		slide_top_left = false;
	}
}
if (slide_bottom_left) {
	x = lerp(x, target_x, 0.1);
	y = lerp(y, target_y, 0.1);
	if (abs(x - target_x) < 0.1 && abs(y - target_y) < 0.1) {
		x = target_x;
		y = target_y;
		slide_bottom_left = false;
	}
}

//check if removable blocks button is pushed
if (oRBlockButtonNormal.r_block_vis) {
	removable_tiles = layer_tilemap_get_id(removable_tiles_ID);
	layer_set_visible(removable_tiles_ID, true);
}
else {
	removable_tiles = layer_tilemap_get_id(ghost_layer_ID);
	layer_set_visible(removable_tiles_ID, false);
}

if (oRBlockButtonBlue.r_block_vis_2) {
	removable_tiles_2 = layer_tilemap_get_id(removable_tiles_2_ID);
	layer_set_visible(removable_tiles_2_ID, true);
}
else {
	removable_tiles_2 = layer_tilemap_get_id(ghost_layer_ID);
	layer_set_visible(removable_tiles_2_ID, false);
}
		
if (oRBlockButtonGreen.r_block_vis_3) {
	removable_tiles_3 = layer_tilemap_get_id(removable_tiles_3_ID);
	layer_set_visible(removable_tiles_3_ID, true);
}
else {
	removable_tiles_3 = layer_tilemap_get_id(ghost_layer_ID);
	layer_set_visible(removable_tiles_3_ID, false);
}