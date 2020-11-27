extends Node2D

onready var animation  = $AnimatedSprite #onready - means wait until scene is ready, Gets animated sprite of Player

func _ready():
	animation.play("Run")


