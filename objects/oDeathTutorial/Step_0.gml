//drop down animation
if (trigger && !death_tutorial && 
!global.spawn_kill &&
!global.box_kill &&
!global.stringed_boxes &&
!global.fireball &&
!global.new_spawn &&
!global.colored_buttons) {
	global.death_rebirth = true;
	speed = (192 / room_speed) - n;
	n += 192 / power(room_speed, 2);
	if (speed < 0) {
		speed = 0;
		alarm[0] = room_speed * 2;
		death_tutorial = true;
	}
}

if (trigger_back) {
	direction = 90;
	speed = n;
	n += 192 / power(room_speed, 2);
	if (y < -1) {
		y = -1;
		trigger_back = false;
		global.death_rebirth = false;
	}
}