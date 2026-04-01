/// @description This loads your saves inside of the game from last time!

if (file_exists("savegame.sav")) {
    var file = file_text_open_read("savegame.sav");
    var json_string = file_text_read_string(file);
    file_text_close(file);

    var save_data = json_decode(json_string);
    
    // Load player data
    complete_1_1 = save_data.OneOneComplete;
	complete_1_2 = save_data.OneOneComplete;
	complete_2_1 = save_data.OneOneComplete;
	complete_2_2 = save_data.OneOneComplete;
	complete_3_1 = save_data.OneOneComplete;
	complete_3_2 = save_data.OneOneComplete;
	complete_4_1 = save_data.OneOneComplete;
	complete_4_2 = save_data.OneOneComplete;
	complete_5_1 = save_data.OneOneComplete;
	complete_5_2 = save_data.OneOneComplete;
	complete_6_1 = save_data.OneOneComplete;
	complete_6_2 = save_data.OneOneComplete;
	complete_7_1 = save_data.OneOneComplete;
	complete_7_2 = save_data.OneOneComplete;
	complete_8_1 = save_data.OneOneComplete;
	complete_8_2 = save_data.OneOneComplete;
	complete_9_1 = save_data.OneOneComplete;
}



