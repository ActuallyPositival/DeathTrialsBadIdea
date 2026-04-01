//how many pixels per movement
move_speed = 32;

//movement variables
left = false;
right = false;
up = false;
down = false;

//registering standard blocks
collision_tiles_ID = layer_get_id("Tile_Collisions");
collision_tiles = layer_tilemap_get_id(collision_tiles_ID);

//registering "death" tiles
death_tiles_ID = layer_get_id("Tile_Death");
death_tiles = layer_tilemap_get_id(death_tiles_ID);

//registering removable tiles
removable_tiles_ID = layer_get_id("Tile_RemovableBlocks");
removable_tiles = layer_tilemap_get_id(removable_tiles_ID);
ghost_layer_ID = layer_get_id("Tile_GhostLayer");
removable_tiles_2_ID = layer_get_id("Tile_RemovableBlocks2");
removable_tiles_2 = layer_tilemap_get_id(removable_tiles_2_ID);
removable_tiles_3_ID = layer_get_id("Tile_RemovableBlocks3");
removable_tiles_3 = layer_tilemap_get_id(removable_tiles_3_ID);

//array for player sprites
num = 0;
player_sprites = array_create(4);
player_sprites[0] = sPlayerFront;
player_sprites[1] = sPlayerBack;
player_sprites[2] = sPlayerLeft;
player_sprites[3] = sPlayerRight;

//superpower cooldown variables
fireball_can_shoot = true;


//movement active
global.game_pause = false;