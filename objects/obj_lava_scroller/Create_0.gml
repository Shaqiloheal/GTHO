/// @description Insert description here
// You can write your code in this editor

scroll_speed = 1;
bubble_spawn_min_speed = 30;
bubble_spawn_max_speed = 120;

alarm_set(0, scroll_speed);
alarm_set(1,300);

var _bubbly_1 = random_range(bubble_spawn_min_speed, bubble_spawn_max_speed);
var _bubbly_2 = random_range(bubble_spawn_min_speed, bubble_spawn_max_speed);
var _bubbly_3 = random_range(bubble_spawn_min_speed, bubble_spawn_max_speed);

alarm_set(2, _bubbly_1);
alarm_set(3, _bubbly_2);
alarm_set(4, _bubbly_3);