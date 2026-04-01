//array for player sprites
num = 1;
player_sprites = array_create(4);
player_sprites[0] = sPlayerFrontBoss;
player_sprites[1] = sPlayerBackBoss;
player_sprites[2] = sPlayerLeftBoss;
player_sprites[3] = sPlayerRightBoss;

//superpower cooldown variables
fireball_can_shoot = true;

//movement active
global.game_pause = false;

//invincibility
invincible = false;
n = 2;

//prep acc
spd = 320 / (3 * room_speed);
a = -1 * 320 / (9 * power(room_speed, 2));


