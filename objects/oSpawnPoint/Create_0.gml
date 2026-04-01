//registering "death" tiles
death_tiles_ID = layer_get_id("Tile_Death");
death_tiles = layer_tilemap_get_id(death_tiles_ID);

//on first spawn kill, tutorial spawn
spawn_kill_tutorial = false;