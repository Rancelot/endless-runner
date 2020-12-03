extends RichTextLabel

func _ready():
	Constants.time = 0
	Signals.connect("stopTimer", self, "stopTimer")
#	time_start = OS.get_unix_time()
#	set_process(true)

func _process(delta):
	if Constants.timer_playing:
		Constants.time += delta
		var seconds = fmod(Constants.time, 60)
		var minutes = fmod(Constants.time, 3600) / 60
		var str_elapsed = "%02d : %02d" % [minutes, seconds]
#	time_now = OS.get_unix_time()
#	elapsed = time_now - time_start
#	var minutes = elapsed / 60
#	var seconds = elapsed % 60
#	var str_elapsed = "%02d : %02d" % [minutes, seconds]
		print("elapsed: ", str_elapsed)
		self.text = str_elapsed

func stopTimer():
	Constants.timer_playing = false
