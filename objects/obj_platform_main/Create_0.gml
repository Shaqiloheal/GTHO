/// @description Insert description here
// You can write your code in this editor

num_of_tiles = choose(0,1,2);

instance_create_layer(x, y, "Platforms", obj_platform_seg_left);

for(var _i=0; _i<num_of_tiles; _i++){
	instance_create_layer(x+((349*_i)+(349/2)), y, "Platforms", obj_platform_seg_mid);
}

instance_create_layer(x + (num_of_tiles*349), y, "Platforms", obj_platform_seg_right);