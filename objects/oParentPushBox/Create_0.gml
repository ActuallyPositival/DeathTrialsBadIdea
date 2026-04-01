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

//smooth box movement on death
slide_top = false;
slide_top_right = false;
slide_right = false;
slide_bottom_right = false;
slide_bottom = false;
slide_bottom_left = false;
slide_left = false;
slide_top_left = false;
target_x = 0;
target_y = 0;

//check for box button coloring
wrong_button = false;

//places that can't be spawned at
t = false;
tr = false;
r = false;
br = false;
b = false;
bl = false;
l = false;
tl = false;