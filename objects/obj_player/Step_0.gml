/// @description 
// Get Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);

// Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;

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

if (place_meeting(x,y+1,obj_wall)) and (key_jump)
{
	vsp = -11;
}

// Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_wall))
	{
			x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// Vertical Collision
if (place_meeting(x,y+vsp,obj_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
			y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;