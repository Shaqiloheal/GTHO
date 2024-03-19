/// @description Insert description here
// You can write your code in this editor
draw_self();

var _progress_pos;

_progress_pos = round((height_reached / 10800) * 320);

draw_sprite(spr_player_progress, 0, x, y - 30 - _progress_pos);

draw_sprite(spr_lava_small, 0, x, y - 30 - round(((height_reached-obj_lava_main.y) / 10800) * 320));