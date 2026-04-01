//sprite based on side
side_blaze = array_create(5);
side_blaze[0] = sSideBlazeBottom;
side_blaze[1] = sSideBlazeTop;
side_blaze[2] = sSideBlazeLeft;
side_blaze[3] = sSideBlazeRight;
side_blaze[4] = noone;
num = 4;

//check whether side blaze has hit the stopping point
side_blaze_active = false;

//size blaze fading var
side_blaze_fade = false;
image_alpha = 1;

//blaze slide in
vx = 0
vy = 0;