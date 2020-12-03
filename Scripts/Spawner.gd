extends Node2D

export (Array, PackedScene) var scenes

var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0
var spawn_waittime = 2.5
onready var spawner = $Timer

func _on_Timer_timeout():
	random_scene.randomize()
	selected_scene_index = random_scene.randi_range(0, scenes.size()-1)		#randi_range -- random integer from 0 to length of array - 1
	var tmp = scenes[selected_scene_index].instance()
	add_child_below_node(self, tmp)		#add as child node to current scene which is a spawner
	
	if Constants.score >= 10:
		spawn_waittime = 1.3
#		spawn_waittime -= 0.2
	elif Constants.score >= 4:
		spawn_waittime = 1.7
#		spawn_waittime -= 0.1
	
	print(spawn_waittime)
	if spawn_waittime < 1.0:
		spawn_waittime = 1.0
	spawner.set_wait_time(spawn_waittime)
