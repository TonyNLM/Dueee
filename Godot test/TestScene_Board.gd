extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ButtonText/Button_Icon.connect("pressed", self.reshuffleArray)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reshuffleArray():
	var newArray = randomizeArray()
	$Board.fillAllSlot(newArray)
	#print("Tried to reshuffle")


func randomizeArray():
	var array: Array = []
	var values: Array = [0, 1, 2, 3, 4, 5, 6, 8]
	for y in range(5):
		var row: Array = []
		for x in range(5):
			var value = values[randi() % values.size()]
			row.append(value)
		array.append(row)
	return array
