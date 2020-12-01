extends Node2D

var current_health = 3 setget update_healthbar
onready var hbar = $HeartBar

func _ready():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)	#modifies master volume of entire scene and game
	Signals.connect("damageplayer", self, "damageplayer")
	self.current_health = 3

func update_healthbar(value):
	current_health = value
	hbar.update_health(current_health)
	if current_health == 0:
		Signals.emit_signal("killplayer")

func damageplayer():
	self.current_health -= 1
