/// @description 
// Get Player Input
var _key_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
var _key_right = keyboard_check(ord("D")) or keyboard_check(vk_right);
var _key_jump = keyboard_check(vk_space) or keyboard_check(vk_up);

// Calculate Movement
var _move = _key_right - _key_left;

hsp = _move * walksp;

if (hsp > 0)
{
	sprite_index = spr_player_walk;
	image_xscale = 1;
}
else if (hsp == 0) 
{
	sprite_index = spr_player_idle;
}
else
{
	sprite_index = spr_player_walk;
	image_xscale = -1;	
}

vsp = vsp + grv;

if (place_meeting(x,y+1,[obj_wall, obj_platform_seg_left, obj_platform_seg_mid, obj_platform_seg_right])) and (_key_jump)
{
	vsp = -20;
}

// Horizontal Collision
if (place_meeting(x+hsp,y, [obj_wall, obj_platform_seg_left, obj_platform_seg_mid, obj_platform_seg_right]))
{
	while (!place_meeting(x+sign(hsp),y,[obj_wall, obj_platform_seg_left, obj_platform_seg_mid, obj_platform_seg_right]))
	{
			x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

if y < room_height / 2 {
	if vsp < 0 {
		var _scroll_speed = -vsp;
		with(obj_screen_scroll) {
			y += _scroll_speed;
		}
		y = room_height / 2;
	}
}

// Vertical Collision
if (place_meeting(x,y+vsp,[obj_wall, obj_platform_seg_left, obj_platform_seg_mid, obj_platform_seg_right]))
{
	while (!place_meeting(x,y+sign(vsp),[obj_wall, obj_platform_seg_left, obj_platform_seg_mid, obj_platform_seg_right]))
	{
			y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;
