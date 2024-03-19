/// @description 
// Get Player Input

if not dead{
	var _key_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
	var _key_right = keyboard_check(ord("D")) or keyboard_check(vk_right);
	var _key_jump = keyboard_check(vk_space) or keyboard_check(vk_up);
	var _key_sprint = keyboard_check(vk_shift) + 1;

	// Calculate Movement
	var _move = _key_right - _key_left;

	hsp = _move * walksp * _key_sprint;

	if (hsp > 0)
	{
		if sprite_index != spr_player_jump {
			sprite_index = spr_player_walk;
		}
		image_xscale = 1;
	}
	else if (hsp == 0) 
	{
		if sprite_index != spr_player_jump {
			sprite_index = spr_player_idle;
		}	
	}
	else
	{
		if sprite_index != spr_player_jump {
			sprite_index = spr_player_walk;
		}
		image_xscale = -1;
	}

	vsp = vsp + grv;

	var _plats =  tag_get_asset_ids("plat", asset_object);

	if (place_meeting(x,y+1,_plats)) and (_key_jump)
	{
		vsp = -25;
		sprite_index = spr_player_jump;
	}

	// Horizontal Collision
	if (place_meeting(x+hsp,y,_plats))
	{
		while (!place_meeting(x+sign(hsp),y,_plats))
		{
				x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;

	if y < room_height / 4 {
		if vsp < 0 {
			var _scroll_speed = -vsp;
			with(obj_screen_scroll) {
				y += _scroll_speed;
			}
			var _back_y = layer_get_y("Background");
		
			layer_y("Background", _back_y +_scroll_speed);
		
			height_reached += _scroll_speed;
			y = room_height / 4;
		}
	}
	
	if y > 1150 {
		dead = true;
	}
	
	// Vertical Collision

	if (place_meeting(x,y+vsp,_plats))
	{
		if sprite_index == spr_player_jump {
			sprite_index = spr_player_idle;
		}	
		while (!place_meeting(x,y+sign(vsp),_plats))
		{
				y = y + sign(vsp);
		}
		vsp = 0;
	}

	y = y + vsp;

	if height_reached >= 10000 and not ending {
		ending = true;
		layer_sequence_create("Transition", 0, 0, seq_transitioner_in);
		alarm_set(0, 20);
	}
} else {
	if not ending {
		audio_play_sound(snd_oof, 1, false);
		ending = true;
		sprite_index = spr_player_dead;
		vspeed = 10;
		alarm_set(1, 60);
	}	
}