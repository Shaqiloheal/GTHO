/// @description Insert description here
// You can write your code in this editor

var _wall_sprite = spr_floor;
for(var _i=0; _i<image_xscale; _i++){
    for(var _j=0; _j<image_yscale; _j++){
        draw_sprite(_wall_sprite, 0, x+(_i*sprite_get_width(_wall_sprite)), y+(_j*sprite_get_height(_wall_sprite)));
    }
}