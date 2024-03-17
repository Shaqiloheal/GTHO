/// @description Insert description here
// You can write your code in this editor
draw_self();

var _progress_pos;

_progress_pos = round((height_reached / 10800) * 350);

draw_sprite(spr_player_progress, 0, x, y - _progress_pos);