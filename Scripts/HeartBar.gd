extends HBoxContainer

var heart_full = preload("res://Assets/GUI Buttons/HP_Bonus_01_RESIZED.png")

func update_health(value):
	update_hearts(value)

func update_hearts(value):
	for i in get_child_count():
		get_child(i).visible = value > i
