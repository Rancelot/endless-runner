extends Control

func _ready():
	Signals.connect("killplayer", self, "gameover")

func _on_TextureButton_pressed():
	get_tree().reload_current_scene()	#reload game when this button is pressed

func gameover():
	Signals.emit_signal("stopTimer")
	self.show()


func _on_TextureButton2_pressed():
	get_tree().quit()
