if (!global.fading && !global.lvl_win && !global.game_pause) {
	//checking which arrow keys are pressed
	if (keyboard_check_pressed(vk_left) == 1 || keyboard_check_pressed(ord("A")) == 1) {
		left = true;
		num = 2;
	}
	else {
		left = false;
	}
	if (keyboard_check_pressed(vk_right) == 1 || keyboard_check_pressed(ord("D")) == 1) {
		right = true;
		num = 3;
	}
	else {
		right = false;
	}
	if (keyboard_check_pressed(vk_up) == 1 || keyboard_check_pressed(ord("W")) == 1) {
		up = true;
		num = 1;
	}
	else {
		up = false;
	}
	if (keyboard_check_pressed(vk_down) == 1 || keyboard_check_pressed(ord("S")) == 1) {
		down = true;
		num = 0;
	}
	else {
		down = false;
	}

	//update player image
	sprite_index = player_sprites[num];

	if (room != rLvl1_1_2) {
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
		
		//right collision
		if (right) {
			if (instance_number(oParentPushBox) > 0) {
				var a = instance_place(x + move_speed, y, oParentPushBox);
			}
			else {
				var a = noone;
			}
			if (instance_number(oConnectPole) > 0) {
				var box1_r = instance_place(x + move_speed, y, oConnectPole.touch_box1);
				var box2_r = instance_place(x + move_speed, y, oConnectPole.touch_box2);
			}
			else {
				var box1_r = noone;
				var box2_r = noone;
			}
			if (instance_number(oSpawnPoint) > 0) {
				var spawn = instance_place(x + move_speed, y, oSpawnPoint);
			}
			else {
				var spawn = noone;
			}
			//check for connected box collisions
			if (box1_r != noone) {
				var box1_col = tilemap_get_at_pixel(collision_tiles, box1_r.x + move_speed, box1_r.y);
				var box1_removable_col = tilemap_get_at_pixel(removable_tiles, box1_r.x + move_speed, box1_r.y);
				var box2_col = tilemap_get_at_pixel(collision_tiles,oConnectPole.touch_box2.x + move_speed, oConnectPole.touch_box2.y);
				var box2_removable_col = tilemap_get_at_pixel(removable_tiles, oConnectPole.touch_box2.x + move_speed, oConnectPole.touch_box2.y);
				var box1_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, box1_r.x + move_speed, box1_r.y);
				var box1_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, box1_r.x + move_speed, box1_r.y);
				var box2_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, oConnectPole.x + move_speed, oConnectPole.y);
				var box2_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, oConnectPole.x + move_speed, oConnectPole.y);
				if (box1_col == 0 && 
				box1_removable_col == 0 && 
				box2_col == 0 && 
				box2_removable_col == 0 &&
				box1_removable_col_2 == 0 &&
				box1_removable_col_3 == 0 &&
				box2_removable_col_2 == 0 &&
				box2_removable_col_3 == 0) {
					box1_r.x += move_speed;
					oConnectPole.touch_box2.x += move_speed;
					oConnectPole.x += move_speed;
					x += move_speed;
				}
			}
			else if (box2_r != noone) {
				var box1_col = tilemap_get_at_pixel(collision_tiles, oConnectPole.touch_box1.x + move_speed, oConnectPole.touch_box1.y);
				var box1_removable_col = tilemap_get_at_pixel(removable_tiles, oConnectPole.touch_box1.x + move_speed, oConnectPole.touch_box1.y);
				var box2_col = tilemap_get_at_pixel(collision_tiles, box2_r.x + move_speed, box2_r.y);
				var box2_removable_col = tilemap_get_at_pixel(removable_tiles, box2_r.x + move_speed, box2_r.y);
				var box1_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, oConnectPole.x + move_speed, oConnectPole.y);
				var box1_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, oConnectPole.x + move_speed, oConnectPole.y);
				var box2_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, box2_r.x + move_speed, box2_r.y);
				var box2_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, box2_r.x + move_speed, box2_r.y);
				if (box1_col == 0 && 
				box1_removable_col == 0 && 
				box2_col == 0 && 
				box2_removable_col == 0 &&
				box1_removable_col_2 == 0 &&
				box1_removable_col_3 == 0 &&
				box2_removable_col_2 == 0 &&
				box2_removable_col_3 == 0) {
					oConnectPole.touch_box1.x += move_speed;
					box2_r.x += move_speed;
					oConnectPole.x += move_speed;
					x += move_speed;
				}
			}
			//check for standard box collisions
			else if (a != noone) {
				var check_rx = a.x;
				while (a != noone) {
					check_rx += move_speed;
					a = instance_place(check_rx, y, oParentPushBox);
				}
				var right_tile = tilemap_get_at_pixel(collision_tiles, check_rx, y);
				var right_removable = tilemap_get_at_pixel(removable_tiles, check_rx, y);
				var right_removable_2 = tilemap_get_at_pixel(removable_tiles_2, check_rx, y);
				var right_removable_3 = tilemap_get_at_pixel(removable_tiles_3, check_rx, y);
				if (right_tile == 0 && 
				right_removable == 0 && 
				right_removable_2 == 0 && 
				right_removable_3 == 0) {
					a = instance_place(x + move_speed, y, oParentPushBox);
					while (a != noone) {
						var b = instance_place(a.x + move_speed, a.y, oParentPushBox);
						a.x += move_speed;
						a = b;
					}
					x += move_speed;
				}
			}
			//check for spawn point collisions
			else if (spawn != noone) {
				global.button_pushed = spawn.group_id;
				var right_spawn = tilemap_get_at_pixel(collision_tiles, spawn.x + move_speed, spawn.y); 
				var right_spawn_removable = tilemap_get_at_pixel(removable_tiles, spawn.x + move_speed, spawn.y); 
				var right_spawn_removable_2 = tilemap_get_at_pixel(removable_tiles_2, spawn.x + move_speed, spawn.y); 
				var right_spawn_removable_3 = tilemap_get_at_pixel(removable_tiles_3, spawn.x + move_speed, spawn.y); 
				var right_box = instance_place(spawn.x + move_speed, spawn.y, oParentPushBox);
				if (right_spawn == 0 && 
				right_spawn_removable == 0 && 
				right_box == noone &&
				right_spawn_removable_2 == 0 &&
				right_spawn_removable_3 == 0) {
					spawn.x += move_speed;
					x += move_speed;
				}
			}
			// check for normal right movement
			else {
				var right_movement = tilemap_get_at_pixel(collision_tiles, x + move_speed, y);
				var right_removable_block = tilemap_get_at_pixel(removable_tiles, x + move_speed, y);
				var right_removable_block_2 = tilemap_get_at_pixel(removable_tiles_2, x + move_speed, y);
				var right_removable_block_3 = tilemap_get_at_pixel(removable_tiles_3, x + move_speed, y);
				if (right_movement == 0 && 
				right_removable_block == 0 &&
				right_removable_block_2 == 0 &&
				right_removable_block_3 == 0) {
					x += move_speed;
				}
			}
		}

		//left collision
		if (left) {
			if (instance_number(oParentPushBox) > 0) {
				var c = instance_place(x - move_speed, y, oParentPushBox);
			}
			else {
				var c = noone;
			}
			if (instance_number(oConnectPole) > 0) {
				var box1_l = instance_place(x - move_speed, y, oConnectPole.touch_box1);
				var box2_l = instance_place(x - move_speed, y, oConnectPole.touch_box2);
			}
			else {
				var box1_l = noone;
				var box2_l = noone;
			}
			if (instance_number(oSpawnPoint) > 0) {
				var spawn = instance_place(x - move_speed, y, oSpawnPoint);
			}
			else {
				var spawn = noone;
			}
			//check for connected box collisions
			if (box1_l != noone) {
				var box1_col = tilemap_get_at_pixel(collision_tiles, box1_l.x - move_speed, box1_l.y);
				var box1_removable_col = tilemap_get_at_pixel(removable_tiles, box1_l.x - move_speed, box1_l.y);
				var box2_col = tilemap_get_at_pixel(collision_tiles,oConnectPole.touch_box2.x - move_speed, oConnectPole.touch_box2.y);
				var box2_removable_col = tilemap_get_at_pixel(removable_tiles, oConnectPole.touch_box2.x - move_speed, oConnectPole.touch_box2.y);
				var box1_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, box1_l.x - move_speed, box1_l.y);
				var box1_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, box1_l.x - move_speed, box1_l.y);
				var box2_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, oConnectPole.x - move_speed, oConnectPole.y);
				var box2_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, oConnectPole.x - move_speed, oConnectPole.y);
				if (box1_col == 0 && 
				box1_removable_col == 0 && 
				box2_col == 0 && 
				box2_removable_col == 0 &&
				box1_removable_col_2 == 0 &&
				box1_removable_col_3 == 0 &&
				box2_removable_col_2 == 0 &&
				box2_removable_col_3 == 0) {
					box1_l.x -= move_speed;
					oConnectPole.touch_box2.x -= move_speed;
					oConnectPole.x -= move_speed;
					x -= move_speed;
				}
			}
			else if (box2_l != noone) {
				var box1_col = tilemap_get_at_pixel(collision_tiles, oConnectPole.touch_box1.x - move_speed, oConnectPole.touch_box1.y);
				var box1_removable_col = tilemap_get_at_pixel(removable_tiles, oConnectPole.touch_box1.x - move_speed, oConnectPole.touch_box1.y);
				var box2_col = tilemap_get_at_pixel(collision_tiles, box2_l.x - move_speed, box2_l.y);
				var box2_removable_col = tilemap_get_at_pixel(removable_tiles, box2_l.x - move_speed, box2_l.y);
				var box1_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, oConnectPole.x - move_speed, oConnectPole.y);
				var box1_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, oConnectPole.x - move_speed, oConnectPole.y);
				var box2_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, box2_l.x - move_speed, box2_l.y);
				var box2_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, box2_l.x - move_speed, box2_l.y);
				if (box1_col == 0 && 
				box1_removable_col == 0 && 
				box2_col == 0 && 
				box2_removable_col == 0 &&
				box1_removable_col_2 == 0 &&
				box1_removable_col_3 == 0 &&
				box2_removable_col_2 == 0 &&
				box2_removable_col_3 == 0) {
					oConnectPole.touch_box1.x -= move_speed;
					box2_l.x -= move_speed;
					oConnectPole.x -= move_speed;
					x -= move_speed;
				}
			}
			//check for standard box collisions
			else if (c != noone) {
				var check_lx = c.x;
				while (c != noone) {
					check_lx -= move_speed;
					c = instance_place(check_lx, y, oParentPushBox);
				}
				var left_tile = tilemap_get_at_pixel(collision_tiles, check_lx, y);
				var left_removable = tilemap_get_at_pixel(removable_tiles, check_lx, y);
				var left_removable_2 = tilemap_get_at_pixel(removable_tiles_2, check_lx, y);
				var left_removable_3 = tilemap_get_at_pixel(removable_tiles_3, check_lx, y);
				if (left_tile == 0 && 
				left_removable == 0 &&
				left_removable_2 == 0 &&
				left_removable_3 == 0) {
					c = instance_place(x - move_speed, y, oParentPushBox);
					while (c != noone) {
						var d = instance_place(c.x - move_speed, c.y, oParentPushBox);
						c.x -= move_speed;
						c = d;
					}
					x -= move_speed;
				}
			}
			//check for spawn point collisions
			else if (spawn != noone) {
				global.button_pushed = spawn.group_id;
				var left_spawn = tilemap_get_at_pixel(collision_tiles, spawn.x - move_speed, spawn.y); 
				var left_spawn_removable = tilemap_get_at_pixel(removable_tiles, spawn.x - move_speed, spawn.y); 
				var left_spawn_removable_2 = tilemap_get_at_pixel(removable_tiles_2, spawn.x - move_speed, spawn.y); 
				var left_spawn_removable_3 = tilemap_get_at_pixel(removable_tiles_3, spawn.x - move_speed, spawn.y);
				var left_box = instance_place(spawn.x - move_speed, spawn.y, oParentPushBox);
				if (left_spawn == 0 && 
				left_spawn_removable == 0 && 
				left_box == noone &&
				left_spawn_removable_2 == 0 &&
				left_spawn_removable_3 == 0) {
					spawn.x -= move_speed;
					x -= move_speed;
				}
			}
			// check for normal left movement
			else {
				var left_movement = tilemap_get_at_pixel(collision_tiles, x - move_speed, y);
				var left_removable_block = tilemap_get_at_pixel(removable_tiles, x - move_speed, y);
				var left_removable_block_2 = tilemap_get_at_pixel(removable_tiles_2, x - move_speed, y);
				var left_removable_block_3 = tilemap_get_at_pixel(removable_tiles_3, x - move_speed, y);
				if (left_movement == 0 && 
				left_removable_block == 0 &&
				left_removable_block_2 == 0 &&
				left_removable_block_3 == 0) {
					x -= move_speed;
				}
			}
		}

		//down collision
		if (down) {
			if (instance_number(oParentPushBox) > 0) {
				var e = instance_place(x, y + move_speed, oParentPushBox);
			}
			else {
				var e = noone;
			}
			if (instance_number(oConnectPole) > 0) {
				var box1_d = instance_place(x, y + move_speed, oConnectPole.touch_box1);
				var box2_d = instance_place(x, y + move_speed, oConnectPole.touch_box2);
			}
			else {
				var box1_d = noone;
				var box2_d = noone;
			}
			if (instance_number(oSpawnPoint) > 0) {
				var spawn = instance_place(x, y + move_speed, oSpawnPoint);
			}
			else {
				var spawn = noone;
			}
			//check for connected box collisions
			if (box1_d != noone) {
				var box1_col = tilemap_get_at_pixel(collision_tiles, box1_d.x, box1_d.y + move_speed);
				var box1_removable_col = tilemap_get_at_pixel(removable_tiles, box1_d.x, box1_d.y + move_speed);
				var box2_col = tilemap_get_at_pixel(collision_tiles,oConnectPole.touch_box2.x, oConnectPole.touch_box2.y + move_speed);
				var box2_removable_col = tilemap_get_at_pixel(removable_tiles, oConnectPole.touch_box2.x, oConnectPole.touch_box2.y + move_speed);
				var box1_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, box1_d.x, box1_d.y + move_speed);
				var box1_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, box1_d.x, box1_d.y + move_speed);
				var box2_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, oConnectPole.x, oConnectPole.y + move_speed);
				var box2_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, oConnectPole.x, oConnectPole.y + move_speed);
				if (box1_col == 0 && 
				box1_removable_col == 0 && 
				box2_col == 0 && 
				box2_removable_col == 0 &&
				box1_removable_col_2 == 0 &&
				box1_removable_col_3 == 0 &&
				box2_removable_col_2 == 0 &&
				box2_removable_col_3 == 0) {
					box1_d.y += move_speed;
					oConnectPole.touch_box2.y += move_speed;
					oConnectPole.y += move_speed;
					y += move_speed;
				}
			}
			else if (box2_d != noone) {
				var box1_col = tilemap_get_at_pixel(collision_tiles, oConnectPole.touch_box1.x, oConnectPole.touch_box1.y + move_speed);
				var box1_removable_col = tilemap_get_at_pixel(removable_tiles, oConnectPole.touch_box1.x, oConnectPole.touch_box1.y + move_speed);
				var box2_col = tilemap_get_at_pixel(collision_tiles, box2_d.x, box2_d.y + move_speed);
				var box2_removable_col = tilemap_get_at_pixel(removable_tiles, box2_d.x, box2_d.y + move_speed);
				var box1_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, oConnectPole.x, oConnectPole.y + move_speed);
				var box1_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, oConnectPole.x, oConnectPole.y + move_speed);
				var box2_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, box2_d.x, box2_d.y + move_speed);
				var box2_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, box2_d.x, box2_d.y + move_speed);
				if (box1_col == 0 && 
				box1_removable_col == 0 && 
				box2_col == 0 && 
				box2_removable_col == 0 &&
				box1_removable_col_2 == 0 &&
				box1_removable_col_3 == 0 &&
				box2_removable_col_2 == 0 &&
				box2_removable_col_3 == 0) {
					oConnectPole.touch_box1.y += move_speed;
					box2_d.y += move_speed;
					oConnectPole.y += move_speed;
					y += move_speed;
				}
			}
			//check for standard box collisions
			else if (e != noone) {
				var check_dy = e.y;
				while (e != noone) {
					check_dy += move_speed;
					e = instance_place(x, check_dy, oParentPushBox);
				}
				var down_tile = tilemap_get_at_pixel(collision_tiles, x, check_dy);
				var down_removable = tilemap_get_at_pixel(removable_tiles, x, check_dy);
				var down_removable_2 = tilemap_get_at_pixel(removable_tiles_2, x, check_dy);
				var down_removable_3 = tilemap_get_at_pixel(removable_tiles_3, x, check_dy);
				if (down_tile == 0 && 
				down_removable == 0 &&
				down_removable_2 == 0 &&
				down_removable_3 == 0) {
					e = instance_place(x, y + move_speed, oParentPushBox);
					while (e != noone) {
						var f = instance_place(e.x, e.y + move_speed, oParentPushBox);
						e.y += move_speed;
						e = f;
					}
					y += move_speed;
				}
			}
			//check for spawn point collisions
			else if (spawn != noone) {
				global.button_pushed = spawn.group_id;
				var down_spawn = tilemap_get_at_pixel(collision_tiles, spawn.x, spawn.y + move_speed); 
				var down_spawn_removable = tilemap_get_at_pixel(removable_tiles, spawn.x, spawn.y + move_speed); 
				var down_spawn_removable_2 = tilemap_get_at_pixel(removable_tiles_2, spawn.x, spawn.y + move_speed); 
				var down_spawn_removable_3 = tilemap_get_at_pixel(removable_tiles_3, spawn.x, spawn.y + move_speed);
				var down_box = instance_place(spawn.x, spawn.y + move_speed, oParentPushBox);
				if (down_spawn == 0 && 
				down_spawn_removable == 0 && 
				down_box == noone &&
				down_spawn_removable_2 == 0 &&
				down_spawn_removable_3 == 0) {
					spawn.y += move_speed;
					y += move_speed;
				}
			}
			// check for normal down movement
			else {
				var down_movement = tilemap_get_at_pixel(collision_tiles, x, y + move_speed);
				var down_removable_block = tilemap_get_at_pixel(removable_tiles, x, y + move_speed);
				var down_removable_block_2 = tilemap_get_at_pixel(removable_tiles_2, x, y + move_speed);
				var down_removable_block_3 = tilemap_get_at_pixel(removable_tiles_3, x, y + move_speed);
				if (down_movement == 0 && 
				down_removable_block == 0 &&
				down_removable_block_2 == 0 &&
				down_removable_block_3 == 0) {
					y += move_speed;
				}
			}
		}

		//up collision
		if (up) {
			if (instance_number(oParentPushBox) > 0) {
				var g = instance_place(x, y - move_speed, oParentPushBox);
			}
			else {
				var g = noone;
			}
			if (instance_number(oConnectPole) > 0) {
				var box1_u = instance_place(x, y - move_speed, oConnectPole.touch_box1);
				var box2_u = instance_place(x, y - move_speed, oConnectPole.touch_box2);
			}
			else {
				var box1_u = noone;
				var box2_u = noone;
			}
			if (instance_number(oSpawnPoint) > 0) {
				var spawn = instance_place(x, y - move_speed, oSpawnPoint);
			}
			else {
				var spawn = noone;
			}
			//check for connected box collisions
			if (box1_u != noone) {
				var box1_col = tilemap_get_at_pixel(collision_tiles, box1_u.x, box1_u.y - move_speed);
				var box1_removable_col = tilemap_get_at_pixel(removable_tiles, box1_u.x, box1_u.y - move_speed);
				var box2_col = tilemap_get_at_pixel(collision_tiles,oConnectPole.touch_box2.x, oConnectPole.touch_box2.y - move_speed);
				var box2_removable_col = tilemap_get_at_pixel(removable_tiles, oConnectPole.touch_box2.x, oConnectPole.touch_box2.y - move_speed);
				var box1_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, box1_u.x, box1_u.y - move_speed);
				var box1_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, box1_u.x, box1_u.y - move_speed);
				var box2_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, oConnectPole.x, oConnectPole.y - move_speed);
				var box2_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, oConnectPole.x, oConnectPole.y - move_speed);
				if (box1_col == 0 && 
				box1_removable_col == 0 && 
				box2_col == 0 && 
				box2_removable_col == 0 &&
				box2_removable_col_2 == 0 &&
				box2_removable_col_3 == 0 &&
				box1_removable_col_2 == 0 &&
				box1_removable_col_3 == 0) {
					box1_u.y -= move_speed;
					oConnectPole.touch_box2.y -= move_speed;
					oConnectPole.y -= move_speed;
					y -= move_speed;
				}
			}
			else if (box2_u != noone) {
				var box1_col = tilemap_get_at_pixel(collision_tiles, oConnectPole.touch_box1.x, oConnectPole.touch_box1.y - move_speed);
				var box1_removable_col = tilemap_get_at_pixel(removable_tiles, oConnectPole.touch_box1.x, oConnectPole.touch_box1.y - move_speed);
				var box2_col = tilemap_get_at_pixel(collision_tiles, box2_u.x, box2_u.y - move_speed);
				var box2_removable_col = tilemap_get_at_pixel(removable_tiles, box2_u.x, box2_u.y - move_speed);
				var box1_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, oConnectPole.x, oConnectPole.y - move_speed);
				var box1_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, oConnectPole.x, oConnectPole.y - move_speed);
				var box2_removable_col_2 = tilemap_get_at_pixel(removable_tiles_2, box2_u.x, box2_u.y - move_speed);
				var box2_removable_col_3 = tilemap_get_at_pixel(removable_tiles_3, box2_u.x, box2_u.y - move_speed);
				if (box1_col == 0 && 
				box1_removable_col == 0 && 
				box2_col == 0 && 
				box2_removable_col == 0 &&
				box2_removable_col_2 == 0 &&
				box2_removable_col_3 == 0 &&
				box1_removable_col_2 == 0 &&
				box1_removable_col_3 == 0) {
					oConnectPole.touch_box1.y -= move_speed;
					box2_u.y -= move_speed;
					oConnectPole.y -= move_speed;
					y -= move_speed;
				}
			}
			//check for standard box collisions
			else if (g != noone) {
				var check_uy = g.y;
				while (g != noone) {
					check_uy -= move_speed;
					g = instance_place(x, check_uy, oParentPushBox);
				}
				var up_tile = tilemap_get_at_pixel(collision_tiles, x, check_uy);
				var up_removable = tilemap_get_at_pixel(removable_tiles, x, check_uy);
				var up_removable_2 = tilemap_get_at_pixel(removable_tiles_2, x, check_uy);
				var up_removable_3 = tilemap_get_at_pixel(removable_tiles_3, x, check_uy);
				if (up_tile == 0 && 
				up_removable == 0 &&
				up_removable_2 == 0 &&
				up_removable_3 == 0) {
					g = instance_place(x, y - move_speed, oParentPushBox);
					while (g != noone) {
						var h = instance_place(g.x, g.y - move_speed, oParentPushBox);
						g.y -= move_speed;
						g = h;
					}
					y -= move_speed;
				}
			}
			//check for spawn point collisions
			else if (spawn != noone) {
				global.button_pushed = spawn.group_id;
				var up_spawn = tilemap_get_at_pixel(collision_tiles, spawn.x, spawn.y - move_speed); 
				var up_spawn_removable = tilemap_get_at_pixel(removable_tiles, spawn.x, spawn.y - move_speed); 
				var up_spawn_removable_2 = tilemap_get_at_pixel(removable_tiles_2, spawn.x, spawn.y - move_speed); 
				var up_spawn_removable_3 = tilemap_get_at_pixel(removable_tiles_3, spawn.x, spawn.y - move_speed);
				var up_box = instance_place(spawn.x, spawn.y - move_speed, oParentPushBox);
				if (up_spawn == 0 && 
				up_spawn_removable == 0 && 
				up_box == noone &&
				up_spawn_removable_2 == 0 &&
				up_spawn_removable_3 == 0) {
					spawn.y -= move_speed;
					y -= move_speed;
				}
			}
			// check for normal up movement
			else {
				var up_movement = tilemap_get_at_pixel(collision_tiles, x, y - move_speed);
				var up_removable_block = tilemap_get_at_pixel(removable_tiles, x, y - move_speed);
				var up_removable_block_2 = tilemap_get_at_pixel(removable_tiles_2, x, y - move_speed);
				var up_removable_block_3 = tilemap_get_at_pixel(removable_tiles_3, x, y - move_speed);
				if (up_movement == 0 && 
				up_removable_block == 0 &&
				up_removable_block_2 == 0 &&
				up_removable_block_3 == 0) {
					y -= move_speed;
				}
			}
		}
	}
	else {
		if (right) {
			var right_movement = tilemap_get_at_pixel(collision_tiles, x + move_speed, y);
			if (right_movement == 0) {
				x += move_speed;
			}
		}
		if (left) {
			var left_movement = tilemap_get_at_pixel(collision_tiles, x - move_speed, y);
			if (left_movement == 0) {
				x -= move_speed;
			}
		}
		if (down) {
			var down_movement = tilemap_get_at_pixel(collision_tiles, x, y + move_speed);
			if (down_movement == 0) {
				y += move_speed;
			}
		}
		if (up) {
			var up_movement = tilemap_get_at_pixel(collision_tiles, x, y - move_speed);
			if (up_movement == 0) {
				y -= move_speed;
			}
		}
	}

	//collision with "death" blocks
	var death = tilemap_get_at_pixel(death_tiles, x, y);
	if (death != 0) {
		with (oDeathTutorial) {
			if (!trigger) {
				trigger = true;
			}
		}
		with (oSpawnPoint) {
			if (is_main) {
				other.x = x;
				other.y = y;
			}
		}
		if (array_length(global.spawn_order) <= 0) {
			room_restart();
		}
		for (var i = 0; i < instance_number(oSpawnPoint); i++) {
			var spawn = instance_find(oSpawnPoint, i);
			var spawn_num = 0;
			if (!spawn.is_main) {
				spawn_num++;
			}
			if (spawn_num >= instance_number(oSpawnPoint)) {
				room_restart();
			}
		}
	}
}
