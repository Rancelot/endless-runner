extends KinematicBody2D

var velocity = Vector2.ZERO

export var jump_velocity = 650.0	#export variables get displayed in inspector when in Player scene
export var gravity_scale = 25.0

#Finite State Machines
enum {
	JUMP,
	RUN,
	IDLE
}

var state = RUN

onready var animation  = $AnimatedSprite #onready - means wait until scene is ready, Gets animated sprite of Player

#FINITE STATE MACHINES -- simplify way code works, transitioning between states
func _physics_process(delta):
	match state:
		RUN:
			animation.play("Run")	#play run animation
		JUMP:
			velocity = Vector2.ZERO
			velocity.y -= jump_velocity
			animation.play("Jump")
			state = IDLE	#set state to IDLE right away due to Jumping only for an instant, wait for player to get to the ground
		IDLE:
			pass
	
	
	velocity.y += gravity_scale #2D, y direction positive is down, negative is upwards, to make player fall
	move_and_collide(velocity*delta) #make frame independent, scaled via time or framerate

#detect any input that comes in its own little loop of Godot Ecosystem.
#for events and button input
func _input(event):
	if state == RUN:
		if event.is_action_pressed("Jump"):
			state = JUMP

func _on_Area2D_body_entered(body):
	if body is StaticBody2D: #StaticBody2d Foreground, when player touches foreground floor, execute code underneath
		state = RUN

func _on_Area2D_body_exited(body):
	if body is StaticBody2D:	#Block Jump
		state = JUMP
