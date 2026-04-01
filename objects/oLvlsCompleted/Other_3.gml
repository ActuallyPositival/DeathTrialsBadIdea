/// @description This manages a central save file - crucial!

var save_data = {
    OneOneComplete: complete_1_1,
	OneTwoComplete: complete_1_2,
	TwoOneComplete: complete_2_1,
	TwoTwoComplete: complete_2_2,
	ThreeOneComplete: complete_3_1,
	ThreeTwoComplete: complete_3_2,
	FourOneComplete: complete_4_1,
	FourTwoComplete: complete_4_2,
	FiveOneComplete: complete_5_1,
	FiveTwoComplete: complete_5_2,
	SixOneComplete: complete_6_1,
	SixTwoComplete: complete_6_2,
	SevenOneComplete: complete_7_1,
	SevenTwoComplete: complete_7_2,
	EightOneComplete: complete_8_1,
	EightTwoComplete: complete_8_2,
	NineOneComplete: complete_9_1,
};

var json_string = json_encode(save_data);

var file = file_text_open_write("savegame.sav");
file_text_write_string(file, json_string);
file_text_close(file);



