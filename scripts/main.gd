extends Node2D

var pileOfCards:Array[int]
var board:Array[Array]
@export var MAX_CARDS:int = 36
@export var AMOUNT_OF_CARD_TYPES:int = 6
@export var BOARD_SIZE_LENGTH = 5
@export var BOARD_SIZE_HEIGHT = 4
var currentDeckAmount:int = 16

func _ready():
	# Create pile of cards
	populatePileOfCards(MAX_CARDS, AMOUNT_OF_CARD_TYPES)
	pileOfCards.shuffle()
	print(pileOfCards) #test
	createBoard(BOARD_SIZE_LENGTH, BOARD_SIZE_HEIGHT)
	populateBoard(BOARD_SIZE_LENGTH, BOARD_SIZE_HEIGHT)
	print("board: " + str(board)) #test
	print("pileOfCards: " + str(pileOfCards)) #test
	$"Board Controller".populateBoard(board)
	$"Board Controller/CenterContainer/MarginContainer/board"\
		.setData(pileOfCards, BOARD_SIZE_LENGTH, BOARD_SIZE_HEIGHT, 
		currentDeckAmount)
	
func _process(delta):
	pass
	
func createBoard(BOARD_LENGTH, BOARD_HEIGHT):
	board.resize(BOARD_SIZE_HEIGHT)
	for row in range(BOARD_SIZE_HEIGHT):
		board[row].resize(BOARD_SIZE_LENGTH)

func populateBoard(BOARD_LENGTH, BOARD_HEIGHT):
	for row in range(BOARD_HEIGHT):
		for col in range(BOARD_LENGTH):
			board[row][col] = pileOfCards.pop_front()

func populatePileOfCards(MAX_CARDS, AMOUNT_OF_CARD_TYPES):
	# Checks
	if MAX_CARDS < 1:
		print("Max cards should be greater than 1.")
		return
	if MAX_CARDS % 2 != 0:
		print("Max cards should be an even number.")
		return
	if AMOUNT_OF_CARD_TYPES < 1:
		print("There should be at least 1 card type.")
		return
	if MAX_CARDS % AMOUNT_OF_CARD_TYPES != 0:
		print("Max cards should be divisible by amount of card types.")
		return
	
	pileOfCards.resize(MAX_CARDS)
	# For each type of card, iterate through so that there are that many types
	# of cards while still having an even distribution.
	for types in range(AMOUNT_OF_CARD_TYPES):
		for i in range(MAX_CARDS/AMOUNT_OF_CARD_TYPES):
			# so that var i wont stagnate at R[1,2,3,4,5], multiply
			pileOfCards[i+types*AMOUNT_OF_CARD_TYPES] = types
