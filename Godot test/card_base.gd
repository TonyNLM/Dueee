extends Node2D

class Card:
	
	var init
	var CardObject	
	var CardNum
	
	
	
	var CardPoints
	var CardSkill
	var TokenSkill
	var CrownImageHolder
	var CardToken
	var CostItems
	

	static var skillIcons = {1:preload("res://Fairy Pics/card_skill_ExtraTurn.png"), 3:preload("res://Fairy Pics/card_skill_TakeToken.png"), 4:preload("res://Fairy Pics/card_skill_TakePriv.png"), 5:preload("res://Fairy Pics/card_skill_StealToken.png")}

	func Card_init():
		CardPoints = CardObject.get_node("CardScore/CardPoints")
		CardSkill = CardObject.get_node("CardSkill")
		TokenSkill = CardObject.get_node("CardSkill/TokenSkill")
		CrownImageHolder = CardObject.get_node("Crown_Base/Crown_Image_Holder")
		CardToken = CardObject.get_node("CardToken")
		CostItems = [
			CardObject.get_node("CostContainer/CostItem1/Cost_Parent"),
			CardObject.get_node("CostContainer/CostItem2/Cost_Parent"),
			CardObject.get_node("CostContainer/CostItem3/Cost_Parent"),
			CardObject.get_node("CostContainer/CostItem4/Cost_Parent")
		]
		init = true
#	func _ready():
#		Card_init()
#		pass # Replace with function body.
#
#	func _process(delta):
#		pass

	func changeCardSkill(skillNum:Enums.Skill):
		if skillNum > 5 or skillNum < 0:
			return

		if skillNum == Enums.Skill.TakeToken:
			TokenSkill.visible = true
		else:
			TokenSkill.visible = false

		if skillNum == Enums.Skill.NoSkill:
			CardSkill.visible = false
			return
		if skillNum == Enums.Skill.WildBonus:
			CardSkill.visible = false
			changeCardTokenColour(Enums.TokenColour.Wild)
			return

		CardSkill.visible = true
		CardSkill.texture = skillIcons[skillNum]
		print("Skill Changed To" + str(skillNum))
		return

	func changeCardTokenColour(colour:Enums.TokenColour):
		if colour > 7 or colour < 0:
			return
		CardToken.changeColour(colour)
		TokenSkill.changeColour(colour)
		return

	func changeCardCost(costArray: Array):
		var Cost_Parent_In_Use = 1
		var i = 0
		var max_array_index = costArray.size() - 1

		while i <= max_array_index and i < 4:
			var costInfo = costArray[i]
			if costInfo[0] >= 1 and costInfo[0] <= 6 and costInfo[1] > 0:
				CostItems[Cost_Parent_In_Use - 1].visible = true
				CostItems[Cost_Parent_In_Use - 1].changeCostColour(costInfo[0])
				CostItems[Cost_Parent_In_Use - 1].changeCostText(costInfo[1])
				Cost_Parent_In_Use += 1

			i += 1
		if Cost_Parent_In_Use != 4:
			while Cost_Parent_In_Use <= 4:
				CostItems[Cost_Parent_In_Use - 1].visible = false
				Cost_Parent_In_Use += 1

	func changeCardScore(num: int):
		if num < 0:
			return
		CardPoints.text = str(num)

	func changeCardCrown(num: int):
		if num < 0 or num > 3:
			return
		CrownImageHolder.setCrownImage(num)
		
		
	func cardLoader(card_num: int):
		CardNum=card_num
		var card_details = lookupCardData(card_num)
		changeCardScore(card_details[Enums.CardDetail.Score])
		changeCardCrown(card_details[Enums.CardDetail.Crown])
		changeCardTokenColour(card_details[Enums.CardDetail.Bonus])
		changeCardSkill(card_details[Enums.CardDetail.Skill])
		changeCardCost(card_details[Enums.CardDetail.Cost])

	func lookupCardData(card_num: int):
		var lookupResult
		if card_num % 2 == 0:
			lookupResult = [1, 2, 2, Enums.TokenColour.Pink, Enums.Skill.ExtraTurn, [[Enums.TokenColour.Red, 3], [Enums.TokenColour.White, 7]]]
		else:
			lookupResult = [2, 3, 3, Enums.TokenColour.Blue, Enums.Skill.StealToken, [[Enums.TokenColour.Green, 4], [Enums.TokenColour.White, 1]]]
		return lookupResult
		
	
	
var _card_ins
var init
func _ready():
	init_self()

func init_self():
	_card_ins=Card.new()
	_card_ins.CardObject = self
	_card_ins.Card_init()
	init = _card_ins.init
