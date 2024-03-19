/// @description Insert description here
// You can write your code in this editor
audio_stop_all();
layer_sequence_create("Transition", 0, 0, seq_transitioner_out);

audio_play_sound(snd_blah, 1, false);

continuing = false;

alarm_set(1, 360);