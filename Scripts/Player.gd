extends KinematicBody2D

var velocity = Vector2.ZERO

export var jump_velocity = 650.0	#export variables get displayed in inspector when in Player scene
export var gravity_scale = 25.0

var can_jump = true

onready var animation  = $AnimatedSprite #onready - means wait until scene is ready, Gets animated sprite of Player

func _ready():
	animation.play("Run")

func _physics_process(delta):
	velocity.y += gravity_scale #2D, y direction positive is down, negative is upwards, to make player fall
	move_and_collide(velocity*delta) #make frame independent, scaled via time or framerate

#detect any input that comes in its own little loop of Godot Ecosystem.
#for events and button input
func _input(event):
	if can_jump:
		velocity = Vector2.ZERO
		if event.is_action_pressed("Jump"):
			velocity.y -= jump_velocity
			animation.play("Jump")



func _on_Area2D_body_entered(body):
	if body is StaticBody2D: #StaticBody2d Foreground, when player touches foreground floor, execute code underneath
		can_jump = true		#Allow jump because grounded
		animation.play("Run")	#play run animation


func _on_Area2D_body_exited(body):
	if body is StaticBody2D:	#Block Jump
		can_jump = false
