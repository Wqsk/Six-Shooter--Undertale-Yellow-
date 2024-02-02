extends Control

@onready var reset : Button = $Reset
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_action_just_pressed("reset_board"):
		_on_reset_pressed()

func _on_reset_pressed():
	get_tree().reload_current_scene()


