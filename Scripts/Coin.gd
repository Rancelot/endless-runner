extends "ScrollMovement.gd"

func _physics_process(delta):
	move()


func _on_Pickup_body_entered(body):
	if body.name == "Player": #player node, if hits player, launch code
		Signals.emit_signal("rewardplayer", 1)	#Number 1, will be scoretoadd parameter
		queue_free()	#removes coin from game scene, Visual appearance of picking up coin shown


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()	#optimization if on mobile, to free up memory, to free it from game, delete coin as soon as its off screen
