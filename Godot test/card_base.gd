extends Node2D

var CardPoints
var CardSkill
var TokenSkill
var CrownImageHolder
var CardToken
var CostItems



static var skillIcons = {1:preload("res://Fairy Pics/card_skill_ExtraTurn.png"), 3:preload("res://Fairy Pics/card_skill_TakeToken.png"), 4:preload("res://Fairy Pics/card_skill_TakePriv.png"), 5:preload("res://Fairy Pics/card_skill_StealToken.png")}



# Called when the node enters the scene tree for the first time.
func _ready():
	CardPoints = $CardScore/CardPoints
	CardSkill = $CardSkill
	TokenSkill = $CardSkill/TokenSkill
	CrownImageHolder = $Crown_Base/Crown_Image_Holder
	CardToken = $CardToken
	CostItems=[$CostContainer/CostItem1/Cost_Parent, $CostContainer/CostItem2/Cost_Parent, $CostContainer/CostItem3/Cost_Parent, $CostContainer/CostItem4/Cost_Parent]
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass








#Below are the function calls to modify the card


func changeCardSkill(skillNum:Enums.Skill):
	if skillNum>5 or skillNum<0:
		return
		
	if (skillNum == Enums.Skill.TakeToken):
		TokenSkill.visible=true
	else:
		TokenSkill.visible=false
		
	if (skillNum == Enums.Skill.NoSkill):
		CardSkill.visible = false
		return
	if (skillNum == Enums.Skill.WildBonus):
		CardSkill.visible = false
		changeCardTokenColour(Enums.TokenColour.Wild)
		return
	
	CardSkill.visible = true
	CardSkill.texture = skillIcons[skillNum]
	print("Skill Changed To"+str(skillNum))
	return
	
	
	
	
	

func changeCardTokenColour(colour:Enums.TokenColour):
	if colour>7 or colour<0:
		return
	CardToken.changeColour(colour)
	TokenSkill.changeColour(colour)
	return
	
	
	
	
	
	#Example: changeCardCost([[1,5],[2,4],[3,3],[4,2]])
func changeCardCost(costArray: Array):
	var Cost_Parent_In_Use = 1
	var i = 0
	var max_array_index = costArray.size()-1
	while (i<=max_array_index and i<4):
		var costInfo = costArray[i]
		#costInfo[0] indicates token cost colour, [1] indicating token cost amount
		#the token cost colour follows the same Enum as token colour
		if costInfo[0]>=1 and costInfo[0]<=6 and costInfo[1]>0:
			CostItems[Cost_Parent_In_Use-1].changeCostColour(costInfo[0])
			CostItems[Cost_Parent_In_Use-1].changeCostText(costInfo[1])
			Cost_Parent_In_Use+=1
		i+=1
	
		
	
	
func changeCardScore(num:int):
	if num<0:
		return
	CardPoints.text = str(num)
	

func changeCardCrown(num:int):
	if num<0 or num>3:
		return
	CrownImageHolder.setCrownImage(num)
	
