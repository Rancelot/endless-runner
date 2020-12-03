extends TextureRect

export(float) var scrollbg_speed = 0.4

func _ready():
	self.material.set_shader_param("scroll_speed", scrollbg_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
