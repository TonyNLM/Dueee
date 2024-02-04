extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func GetCardDetail(Card_No: int):
	var lookupResult
		
	#tier, card score, crown count, bonus colour, bonus colour count, skill, cost
	if Card_No % 2 == 0:
		lookupResult = [1, Card_No, 2, Enums.TokenColour.Pink, 2,Enums.Skill.ExtraTurn, [[Enums.TokenColour.Red, 3], [Enums.TokenColour.White, 7]]]
	else:
		lookupResult = [2, Card_No, 3, Enums.TokenColour.Blue, 1,Enums.Skill.StealToken, [[Enums.TokenColour.Green, 4], [Enums.TokenColour.White, 1]]]
	return lookupResult
