extends RichTextLabel

var time_elasped := 0.0
var minutes
var seconds
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elasped += delta
	minutes = time_elasped/60
	seconds = fmod(time_elasped, 60)
	updateTimer(minutes, seconds)

func updateTimer(mins, secs):
	if mins == null:
		mins = "00"
	mins = int(mins)
	secs = int(secs)
	text = str(mins) + ":" + str(secs)
