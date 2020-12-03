extends RichTextLabel

func _ready():
	Constants.time = 0
	Signals.connect("stopTimer", self, "stopTimer")

func _process(delta):
	if Constants.timer_playing:
		Constants.time += delta
		var seconds = fmod(Constants.time, 60)
		var minutes = fmod(Constants.time, 3600) / 60
		var str_elapsed = "%02d : %02d" % [minutes, seconds]
		self.text = str_elapsed

func stopTimer():
	Constants.timer_playing = false
