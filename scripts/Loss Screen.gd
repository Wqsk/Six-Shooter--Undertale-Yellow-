extends Window


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func setVisibility(input : bool):
	if input:
		visible = true
		get_tree().call_group("timer", "giveTime", "lose")
		
func setTime(time):
	$CenterContainer2/VBoxContainer/CenterContainer/TimeText.text = time
