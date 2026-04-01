//variable for if player is colliding with any connected boxes
touch_box1 = noone;
touch_box2 = noone;

//make sure it doesn't spasm
connect_bar_list = array_create(4);
connect_bar_list[0] = sConnectPole;
connect_bar_list[1] = sConnectPoleHorz;
connect_bar_list[2] = sConnectPoleLong;
connect_bar_list[3] = sConnectPoleSuperLong;

spr_index = connect_bar_list[pole_index]
sprite_index = spr_index;

