extends ItemList

var deck
var BOARD_SIZE_LENGTH
var BOARD_SIZE_HEIGHT
var BOARD_SIZE
var currentDeckAmount
var icon
var prevItemSelectedIndex

func setData(pileOfCards:Array[int], BOARD_LENGTH, BOARD_HEIGHT, 
		currDeckAmount):
	deck = pileOfCards
	BOARD_SIZE_LENGTH = BOARD_LENGTH
	BOARD_SIZE_HEIGHT = BOARD_HEIGHT
	currentDeckAmount = currDeckAmount
	BOARD_SIZE = BOARD_HEIGHT*BOARD_LENGTH

func addIconItem(iconPath):
	if iconPath != null:
		add_icon_item(load(iconPath))
	
func _on_item_clicked(index, at_position, mouse_button_index):
	var otherSelectedItemIndex
	var selectedItems
	if prevItemSelectedIndex != null:
		# User clicked same tile. Don't do anything besides unselecting.
		if prevItemSelectedIndex == index || isHighlighted(index):
			prevItemSelectedIndex = null
			unhighlightAll()
			return
			
		if prevItemSelectedIndex > index:
			remove_item(prevItemSelectedIndex)
			remove_item(index)
		elif index > prevItemSelectedIndex:
			remove_item(index)
			remove_item(prevItemSelectedIndex)
		fillFromDeck(deck)
		unhighlightAll()
		prevItemSelectedIndex = null
	else:
		prevItemSelectedIndex = index
		highlightNeighbors(index)

func isHighlighted(index):
	# if item at index has not changed from default, then it is not highlighted.
	return get_item_icon_modulate(index) != Color(1,1,1)

func getNeighbors(index):
	if index == 0 || index%5 == 0:
		return 1
	if (index+1)%5 == 0:
		return 2
	else:
		return 0

func unhighlightAll():
	for cards in range(BOARD_SIZE):
		set_item_icon_modulate(cards, Color(1,1,1))
		
func highlightNeighbors(index):
	var edgeValue = getNeighbors(index)
	print("Edge Value: " + str(edgeValue)) #test
	for cards in range(BOARD_SIZE):
		# Top and Bottom
		if cards == index || cards+5 == index || cards-5 == index:
			pass
		# Left and Right
		elif cards-1 == index || cards+1 == index:
			pass
		# Corners
		elif cards-6 == index || cards-4 == index || cards+6 == index ||\
				cards+4 == index:
			pass
		else:
			set_item_icon_modulate(cards, Color(0.8, 0.8, 0.8))
			
		if edgeValue == 1:
			if cards == index-1 || cards == index+4 || cards == index-6:
				set_item_icon_modulate(cards, Color(0.8, 0.8, 0.8))
		if edgeValue == 2:
			if cards == index+1 || cards == index-4 || cards == index+6:
				set_item_icon_modulate(cards, Color(0.8, 0.8, 0.8))

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

