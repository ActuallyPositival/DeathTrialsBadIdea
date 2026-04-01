//return to lvls room
if (room != rIntroScreen && 
room != rLevelsScreen && 
room != rStartScreen && 
room != rLose && 
room != rLvlBossFight &&
room != rWinAndCredits &&
room != rStartScreen) {
	if (!global.fading) {
		if (oDim.dim_alpha > 0) {
			oDim.dim_alpha = 0;
			if (instance_number(oSpawnKillElaboration) > 0) {
				with (oSpawnKillElaboration) {
					instance_destroy();
				}
			}
			if (instance_number(oBoxKillElaboration) > 0) {
				with (oBoxKillElaboration) {
					instance_destroy();
				}
			}
			if (instance_number(oFireballElaboration) > 0) {
				with (oFireballElaboration) {
					instance_destroy();
				}
			}
		}
		with (oFadeBox) {
			fade_out = true;
			change_lvl_screen = true;
		}
		if (room == rLvlBoss) {
			audio_stop_all();
			audio_play_sound(soundMenu, 0, true);
		}
	}
}





