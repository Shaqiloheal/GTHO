layer_sequence_create("Transition", 0, 0, seq_transitioner_out);

audio_stop_all();

audio_play_sound(snd_music, 1, true);
hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 6;

globalvar dead;
globalvar height_reached;

dead = false;
height_reached = 0;

ending = false;