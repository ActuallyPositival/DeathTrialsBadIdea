//spawn lava puddles without overlap
if (lava_surge) {
	var bound_x1 = 64;
	var bound_y1 = 64;
	var bound_x2 = room_width - 64;
	var bound_y2 = room_height - 64;
	
	puddle_x = random_range(bound_x1, bound_x2);
	puddle_y = random_range(bound_y1, bound_y2);
	
	var nearest = instance_nearest(puddle_x, puddle_y, oLavaPuddle);

	if (nearest != noone) {
	    while (point_distance(puddle_x, puddle_y, nearest.x, nearest.y) < 96) {
	        puddle_x = random_range(bound_x1, bound_x2);
	        puddle_y = random_range(bound_y1, bound_y2);
	        nearest = instance_nearest(puddle_x, puddle_y, oLavaPuddle);
	    }
	}
	
	show_debug_message("lava_surge = " + string(lava_surge));
	var puddle = instance_create_layer(puddle_x, puddle_y, "Instances", oLavaPuddle);
	var warning = instance_create_layer(puddle_x, puddle_y, "Instances", oPuddleWarning);
	puddle.depth = 400;
	warning.depth = 399;
	
	//start again
	lava_surge = false;
}



