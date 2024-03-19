/// @description Insert description here
// You can write your code in this editor
var _dropping = random_range(120, 360);

var _obstacle = choose(obj_falling_1, obj_falling_2, obj_falling_3);
var _x_coord = random_range(100,1800)

instance_create_layer(_x_coord, -600, "Lava", _obstacle);

alarm_set(0, _dropping);