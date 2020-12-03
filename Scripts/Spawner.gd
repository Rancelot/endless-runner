extends Node2D

export (Array, PackedScene) var scenes

var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0
var spawn_waittime = 3
onready var spawner = $Timer

func _on_Timer_timeout():
	random_scene.randomize()
	selected_scene_index = random_scene.randi_range(0, scenes.size()-1)		#randi_range -- random integer from 0 to length of array - 1
	var tmp = scenes[selected_scene_index].instance()
	add_child_below_node(self, tmp)		#add as child node to current scene which is a spawner
	spawn_waittime -= 0.3
	print(spawn_waittime)
	if spawn_waittime < 1.0:
		spawn_waittime = 1.0
	spawner.set_wait_time(spawn_waittime)
