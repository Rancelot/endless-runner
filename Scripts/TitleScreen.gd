extends Control

func _ready():
	pass # Replace with function body.

func _on_PlayButton_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
