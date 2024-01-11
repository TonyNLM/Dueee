extends Node



func _ready():
	pass

func _process(delta):
	pass
	
func fadeOutObject(obj, delay:float=0, revert:bool=false):
	var fadeTween = create_tween()
	var currentColor = obj.modulate
	var targetColor = Color(currentColor.r, currentColor.g, currentColor.b, 0)
	fadeTween.tween_property(obj, "modulate", targetColor, 2).set_delay(delay)
	if revert:
		var lambda = func():			
			obj.modulate.a = 1	
		fadeTween.tween_callback(lambda)
		
	
#func revertFadedObject(obj):
#	obj.modulate.a = 1

func fadeInObject(obj):
	var fadeTween = create_tween()
	var currentColor = obj.modulate
	var targetColor = Color(currentColor.r, currentColor.g, currentColor.b, 1)
	fadeTween.tween_property(obj, "modulate", targetColor, 2)

func cardLoader(card_obj:Node, card_num:int):
	var card_details=lookupCardData(card_num)
	#tier is not yet implemented
	card_obj.changeCardScore(card_details[Enums.CardDetail.Score])
	card_obj.changeCardCrown(card_details[Enums.CardDetail.Crown])
	card_obj.changeCardTokenColour(card_details[Enums.CardDetail.Bonus])
	card_obj.changeCardSkill(card_details[Enums.CardDetail.Skill])
	card_obj.changeCardCost(card_details[Enums.CardDetail.Cost])
	
	
	
	pass
	#incomplete function
func lookupCardData(card_num:int):
	var lookupResult = [1,2,2,Enums.TokenColour.Pink, Enums.Skill.ExtraTurn, [[Enums.TokenColour.Red, 3],[Enums.TokenColour.White, 7]]]
	return lookupResult
	


