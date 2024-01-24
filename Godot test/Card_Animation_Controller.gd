extends Control


var tier_element_array
var card_element_array
var token_element_array

var Move_Token
var Move_Tier
var Move_Card

var cardList

var TierTween
var CardTween

var tempVal=0

var timer := Timer.new()

signal OnCardTakenComplete(tier, slot)
signal OnCardRefillComplete(tier, slot)


static var Tier_Icons ={1:preload("res://Fairy Pics/tier1CardBack.png"), 2:preload("res://Fairy Pics/tier2CardBack.png"),3:preload("res://Fairy Pics/tier3CardBack.png")} 

# Called when the node enters the scene tree for the first time.
func _ready():
	var parent = self.get_parent()
	cardList = parent.get_node("Card_pile")
	print(cardList)
	tier_element_array = [cardList.get_node("HBoxContainer/CenterContainer/Tier_Card"),cardList.get_node("HBoxContainer2/CenterContainer/Tier_Card"),cardList.get_node("HBoxContainer3/CenterContainer/Tier_Card")]
	card_element_array = [[cardList.get_node("HBoxContainer/CenterContainer2/Card_Base/CardBase"),cardList.get_node("HBoxContainer/CenterContainer3/Card_Base/CardBase"),cardList.get_node("HBoxContainer/CenterContainer4/Card_Base/CardBase"),cardList.get_node("HBoxContainer/CenterContainer5/Card_Base/CardBase"),cardList.get_node("HBoxContainer/CenterContainer6/Card_Base/CardBase")],
	[cardList.get_node("HBoxContainer2/CenterContainer2/Card_Base/CardBase"),cardList.get_node("HBoxContainer2/CenterContainer3/Card_Base/CardBase"),cardList.get_node("HBoxContainer2/CenterContainer4/Card_Base/CardBase"),cardList.get_node("HBoxContainer2/CenterContainer5/Card_Base/CardBase")],
	[cardList.get_node("HBoxContainer3/CenterContainer2/Card_Base/CardBase"),cardList.get_node("HBoxContainer3/CenterContainer3/Card_Base/CardBase"),cardList.get_node("HBoxContainer3/CenterContainer4/Card_Base/CardBase")]
	]
	Move_Tier=$Move_Tier
	Move_Token=$Move_Token
	Move_Card=$Move_Card
	
	
	
	#region for testing
	OnCardTakenComplete.connect(MoveTierCardToPosition)
	add_child(timer)
	timer.wait_time = 6
	timer.connect("timeout", _on_Timer_timeout)
	timer.start()
	#end
	
#	cardList.get_card_reference()
#	card_element_array = cardList.CardList
	print(tier_element_array)
	
	#Move_Tier.global_position = tier_element_array[1].global_position
	
	#MoveTierCardToPosition(1,2)
	
	
	
	
	pass # Replace with function body.

func MoveTierCardToPosition(tier:int, slot:int):
	Move_Tier.texture = Tier_Icons[tier]
	var index = tier-1
	
	Move_Tier.global_position = tier_element_array[index].global_position
	if TierTween:
		TierTween.kill()
	TierTween = create_tween()
	Move_Tier.modulate.a=1
	var finish_callback = func MoveTierFinish():
		card_element_array[index][slot].get_parent().visible=true
		card_element_array[index][slot].get_parent().get_parent().get_node("Button").visible=true
	#print(tier_element_array[0].position)
	#TierTween.tween_property(Move_Tier, "position", card_element_array[tier][slot].global_position, 4)
	#print(Move_Tier.global_position, tier_element_array[tier].global_position)
	TierTween.tween_property(Move_Tier, "position", card_element_array[index][slot].global_position, 1)
	TierTween.tween_callback(finish_callback)
	TierTween.tween_property(Move_Tier, "modulate", Color(1,1,1,0), 1)
	
	
		
	#print(card_element_array[tier][slot].global_position, tier_element_array[tier].global_position)
	pass
	
	
func MoveCardToPosition(tier:int, slot:int, player:int):
	var index = tier-1
	var card_element = card_element_array[index][slot].get_parent()
	Move_Card._card_ins.cardLoader(card_element._card_ins.CardNum)
	
	
	Move_Card.global_position = card_element.global_position
	card_element.visible=false
	card_element.get_parent().get_node("Button").visible=false
	cardList.force_remove_focus()
	if CardTween:
		CardTween.kill()
	CardTween = create_tween()
	Move_Card.modulate.a=1
	
	CardTween.tween_property(Move_Card, "position", Vector2(0,0), 2)
	CardTween.tween_property(Move_Card, "modulate", Color(1,1,1,0), 1)
	var finish_callback = func MoveCardFinish():
		OnCardTakenComplete.emit(tier, slot)
	CardTween.tween_callback(finish_callback)
	
	

	#print(card_element_array[tier][slot].global_position, tier_element_array[tier].global_position)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
	

	

func _on_Timer_timeout():
	var firstParam = randf_range(1, 4)
	var secondParam = randf_range(0, 3)
	#MoveTierCardToPosition(firstParam, secondParam)
	MoveCardToPosition(firstParam, secondParam, 1)
