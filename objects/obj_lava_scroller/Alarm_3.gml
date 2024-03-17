/// @description Insert description here
// You can write your code in this editor
var _bubbly_2 = random_range(bubble_spawn_min_speed, bubble_spawn_max_speed);

var _pos = random_range(200, 3600);

instance_create_layer(x + _pos,y,"Lava", obj_bubble_2);

alarm_set(3, _bubbly_2);