extends Control

@onready var board = $CenterContainer/MarginContainer/board
var icon
var deck
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func populateBoard(values:Array[Array]):
	for rows in values:
		for tiles in rows:
			if tiles == 0:
				icon = "res://sprites/C.png"
			elif tiles == 1:
				icon = "res://sprites/S.png"
			elif tiles == 2:
				icon = "res://sprites/A.png"
			elif tiles == 3:
				icon = "res://sprites/M.png"
			elif tiles == 4:
				icon = "res://sprites/M2.png"
			elif tiles == 5:
				icon = "res://sprites/E.png"
			else:
				icon = null	
			board.addIconItem(icon)

	
