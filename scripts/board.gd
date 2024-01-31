extends ItemList

var deck
var BOARD_SIZE_LENGTH
var BOARD_SIZE_HEIGHT
var currentDeckAmount
var icon
var prevItemSelectedIndex

func setData(pileOfCards:Array[int], BOARD_LENGTH, BOARD_HEIGHT, 
		currDeckAmount):
	deck = pileOfCards
	BOARD_SIZE_LENGTH = BOARD_LENGTH
	BOARD_SIZE_HEIGHT = BOARD_HEIGHT
	currentDeckAmount = currDeckAmount

func addIconItem(iconPath):
	if iconPath != null:
		add_icon_item(load(iconPath))
		
func _on_item_selected(index):
	#	remove_item(index)
	#	fillFromDeck(deck)
	pass
	
func _on_item_clicked(index, at_position, mouse_button_index):
	var otherSelectedItemIndex
	var selectedItems
	if prevItemSelectedIndex != null:
		if prevItemSelectedIndex > index:
			remove_item(prevItemSelectedIndex)
			remove_item(index)
		else:
			remove_item(index)
			remove_item(prevItemSelectedIndex)
		fillFromDeck(deck)
		prevItemSelectedIndex = null
	else:
		prevItemSelectedIndex = index

func fillFromDeck(pileOfCards):
	if currentDeckAmount <= 0:
		return
	print("CurrDckAmt: " + str(currentDeckAmount))
	for emptyItems in range(BOARD_SIZE_HEIGHT*BOARD_SIZE_LENGTH - 
			get_item_count()):
		print("empt. Space: " + str(BOARD_SIZE_HEIGHT*BOARD_SIZE_LENGTH - 
			get_item_count()))
		getIconFromValue(pileOfCards[0])
		pileOfCards.pop_front()
		add_icon_item(load(icon))
		currentDeckAmount -= 1

func getIconFromValue(value:int):
	if value == 0:
		icon = "res://sprites/C.png"
	elif value == 1:
		icon = "res://sprites/S.png"
	elif value == 2:
		icon = "res://sprites/A.png"
	elif value == 3:
		icon = "res://sprites/M.png"
	elif value == 4:
		icon = "res://sprites/M2.png"
	elif value == 5:
		icon = "res://sprites/E.png"
	else:
		icon = null

