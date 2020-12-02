extends Node2D

var current_health = 3 setget update_healthbar
onready var hbar = $HeartBar
onready var damage_sound = $DamagePlayer

#Scrolling Background References for Parallax
onready var foreground = get_node("Foreground/ScrollingBackground").material			#Base scroll speed = 0.2
onready var bgtrees_fore = get_node("BgTreesForeground/ScrollingBackground").material	#Base scroll speed = 0.15
onready var bgmiddle_decor = get_node("BgMiddleDecor/ScrollingBackground").material		#Base scroll speed = 0.11
onready var bg_decor = get_node("BgDecor/ScrollingBackground").material					#Base scroll speed = 0.10

func _ready():#on restart or when game starts, this function is called.
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)	#modifies master volume of entire scene and game
	Signals.connect("damageplayer", self, "damageplayer")
	self.current_health = 3
	Constants.score = 0		#set score of the player back to 0 so all scrolling and animations follow through with initial speeds

func _process(delta):
	
	#Level scrolling progression here to be continued
	if Constants.score >= 2:
		foreground.set_shader_param("scroll_speed", 0.25)
		bgtrees_fore.set_shader_param("scroll_speed", 0.20)
		bgmiddle_decor.set_shader_param("scroll_speed", 0.16)
		bg_decor.set_shader_param("scroll_speed", 0.15)
	
	if Constants.score >= 5:
		foreground.set_shader_param("scroll_speed", 0.40)
		bgtrees_fore.set_shader_param("scroll_speed", 0.35)
		bgmiddle_decor.set_shader_param("scroll_speed", 0.31)
		bg_decor.set_shader_param("scroll_speed", 0.30)

func update_healthbar(value):
	current_health = value
	hbar.update_health(current_health)
	if current_health == 0:
		Signals.emit_signal("killplayer")

func damageplayer():
	self.current_health -= 1
	damage_sound.play()
