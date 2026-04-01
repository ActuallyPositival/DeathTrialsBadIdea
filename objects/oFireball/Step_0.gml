//check if removable box button is pushed
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

//on collision with wall, disintigrate
var wall_col = tilemap_get_at_pixel(collision_tiles, x, y);
var removable_block_col = tilemap_get_at_pixel(removable_tiles, x, y);
var removable_block_2_col = tilemap_get_at_pixel(removable_tiles_2, x, y);
var removable_block_3_col = tilemap_get_at_pixel(removable_tiles_3, x, y);
if (wall_col != 0 ||
removable_block_col != 0 ||
removable_block_2_col != 0 ||
removable_block_3_col != 0) {
	instance_destroy();
}

//if fireball goes out of bounds, destroy it
if (x < 0 || y < 0 || x > room_width || y > room_height) {
	instance_destroy();
}

//if fireball contacts box, kill both fireball and box
var box = instance_place(x, y, oParentPushBox);
if (box != noone) {
	instance_destroy(box);
	instance_destroy();
}