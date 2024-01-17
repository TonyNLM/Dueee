extends Control


var tier_element_array
var card_element_array
var token_element_array

var Move_Token
var Move_Tier
var Move_Card

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
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
