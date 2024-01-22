extends Control


var tier_element_array
var card_element_array
var token_element_array

var Move_Token
var Move_Tier
var Move_Card

var TierTween
var CardTween

var tempVal=0

var timer := Timer.new()


static var Tier_Icons ={1:preload("res://Fairy Pics/tier1CardBack.png"), 2:preload("res://Fairy Pics/tier2CardBack.png"),3:preload("res://Fairy Pics/tier3CardBack.png")} 

# Called when the node enters the scene tree for the first time.
func _ready():
	var parent = self.get_parent()
	var cardList = parent.get_node("Card_pile")
	tier_element_array = [cardList.get_node("HBoxContainer/CenterContainer/Tier_Card"),cardList.get_node("HBoxContainer2/CenterContainer/Tier_Card"),cardList.get_node("HBoxContainer3/CenterContainer/Tier_Card")]
	Move_Tier=$Move_Tier
	Move_Token=$Move_Token
	Move_Card=$Move_Card
	
	cardList.get_card_reference()
	card_element_array = cardList.CardList
	print(tier_element_array)
	parent.get_node("Card_pile/HBoxContainer2/CenterContainer2/Card_Base").global_position=Vector2(0,0)
	var newpos = parent.get_node("Card_pile/HBoxContainer2/CenterContainer2/Card_Base").global_position
	Move_Tier.global_position = newpos
	print(newpos)
	#Move_Tier.global_position = tier_element_array[1].global_position
	
	#MoveTierCardToPosition(1,2)
	
	
	
	
	pass # Replace with function body.

func MoveTierCardToPosition(tier:int, slot:int):
	tier=tier-1
	Move_Tier.global_position = tier_element_array[tier].global_position
#	var TierTween = create_tween()
#	#print(tier_element_array[0].position)
#	TierTween.tween_property(Move_Tier, "position", card_element_array[tier][slot].global_position, 4)
#	print(card_element_array[tier][slot].global_position)
	pass
	
	
func MoveCardToPosition(tier:int, slot:int, player:int):
	Move_Card._card_ins.cardLoader(card_element_array[tier-1][slot].get_parent()._card_ins.CardNum)
	tier=tier-1
	
	Move_Card.global_position = card_element_array[tier][slot].global_position
	if CardTween:
		CardTween.kill()
	CardTween = create_tween()
	Move_Card.modulate.a=1
	#print(tier_element_array[0].position)
	#TierTween.tween_property(Move_Tier, "position", card_element_array[tier][slot].global_position, 4)
	#print(Move_Tier.global_position, tier_element_array[tier].global_position)
	CardTween.tween_property(Move_Card, "position", Vector2(0,0), 1)
	CardTween.tween_property(Move_Card, "modulate", Color(1,1,1,0), 1)
		
	#print(card_element_array[tier][slot].global_position, tier_element_array[tier].global_position)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

	

func _on_Timer_timeout():
	var firstParam = randf_range(1, 4)
	var secondParam = randf_range(0, 3)
	MoveTierCardToPosition(firstParam, secondParam)
	MoveCardToPosition(firstParam, secondParam, 1)
