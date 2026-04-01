//if player is colliding with connected boxes, set the id
touch_box1 = collision_rectangle(x, y, x + 32, y + 32, oParentPushBox, false, true);
touch_box2 = collision_rectangle(x + (sprite_get_width(spr_index) - 32), 
								y + (sprite_get_height(spr_index) - 32),
								x + sprite_get_width(spr_index),
								y + sprite_get_height(spr_index), 
								oParentPushBox, 
								false, 
								true);

//once contact is lost, move out of screen
if (touch_box1 == noone || touch_box2 == noone || touch_box1 == touch_box2) {
	with (oConnectedBoxesTutorial) {
		if (!trigger) {
			trigger = true;
		}
	}
    instance_destroy();
}
