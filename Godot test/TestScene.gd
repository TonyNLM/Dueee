extends Node2D
var skillCount
var tokenCount

# Called when the node enters the scene tree for the first time.
func _ready():
	skillCount = Enums.Skill.NoSkill
	tokenCount = Enums.TokenColour.Blue
	$Card_Base.changeCardTokenColour(Enums.TokenColour.Blue)
	$Card_Base.changeCardSkill(Enums.Skill.TakePriv)
	$ButtonText/Button_Icon.pressed.connect(self.increaseSkill)
	$ButtonText2/Button_Icon.pressed.connect(self.decreaseSkill)
	$ButtonText3/Button_Icon.pressed.connect(self.increaseToken)
	$ButtonText4/Button_Icon.pressed.connect(self.decreaseToken)
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func increaseSkill():
	skillCount+=1
	if skillCount>5:
		skillCount=0
	$Card_Base.changeCardSkill(skillCount)
func decreaseSkill():
	skillCount-=1
	if skillCount<0:
		skillCount=5
	$Card_Base.changeCardSkill(skillCount)
	
func increaseToken():
	tokenCount+=1
	if tokenCount>7:
		tokenCount=0
	$Card_Base.changeCardTokenColour(tokenCount)
	
		
func decreaseToken():
	tokenCount-=1
	if tokenCount<0:
		tokenCount=7
	$Card_Base.changeCardTokenColour(tokenCount)
	
