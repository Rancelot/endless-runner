extends "ScrollMovement.gd"

func _physics_process(delta):
	move()


func _on_EffectDamage_body_entered(body):
	if body.name == "Player": #player node, if hits player, launch code
		Signals.emit_signal("damageplayer")
		#Signals.emit_signal("killplayer")
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()	#optimization if on mobile, to free up memory, delete barrel as soon as its off screen
