//shoot fireball in facing direction if powerup collected
if (global.fireball_collect && fireball_can_shoot) {
	var fireball = instance_create_layer(x + 16, y + 16, "Instances", oFireball);
	fireball.depth = -10000;
	if (num == 0) {
		fireball.image_angle = 270;
	}
	if (num == 1) {
		fireball.image_angle = 90;
	}
	if (num == 2) {
		fireball.image_angle = 180;
	}
	if (num == 3) {
		fireball.image_angle = 0;
	}
	fireball.direction = fireball.image_angle;
	fireball.speed = 3.5;
	
	//reset fireball cooldown
	fireball_can_shoot = false;
	alarm[0] = room_speed;
}





