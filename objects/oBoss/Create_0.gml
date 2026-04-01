//detect when boss is hit
boss_hit = false;

//location of boss on start
x = room_width / 2;
y = 128;

//bounds of attack
pos_x1 = 32;
pos_x2 = room_width - 32;
pos_y1 = 32;
pos_y2 = room_height - 32;

//warning vars
a1 = false;
a2 = false;
a3 = false;

//move bomba vars
prepare_1 = false;
attack_1 = false;
forward_bomba = false;
backward_bomba = false;
g = 0;
n = 0;
deg = 0;
blaze_counter = 0;
attack_1_pause = false;

//spray lava vars
attack_2 = false;
active_2 = false;
triangle_move_1 = false;
triangle_move_2 = false;
triangle_move_3 = false;
tri_counter = 0;
tri_slow_down = false;
v = 0;

//edge blast vars
attack_3 = false;
boss_slide = false;
boss_slide_back = false;
q = 0;

//attack timer
alarm[0] = room_speed * 3;




