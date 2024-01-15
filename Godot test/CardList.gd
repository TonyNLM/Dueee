extends VBoxContainer

var CardList_CardValue
var CardList
var init
# Called when the node enters the scene tree for the first time.
func _ready():
	testing_self_setup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func get_card_reference():
	var CardList1 = [$HBoxContainer/CenterContainer2/Card_Base, $HBoxContainer/CenterContainer3/Card_Base, $HBoxContainer/CenterContainer4/Card_Base,$HBoxContainer/CenterContainer5/Card_Base,$HBoxContainer/CenterContainer6/Card_Base]
	var CardList2 = [$HBoxContainer2/CenterContainer2/Card_Base, $HBoxContainer2/CenterContainer3/Card_Base, $HBoxContainer2/CenterContainer4/Card_Base,$HBoxContainer2/CenterContainer5/Card_Base]
	var CardList3 = [$HBoxContainer3/CenterContainer2/Card_Base, $HBoxContainer3/CenterContainer3/Card_Base, $HBoxContainer3/CenterContainer4/Card_Base]
	CardList=[CardList1, CardList2, CardList3]
	CardList_CardValue=[[0,0,0,0,0],[0,0,0,0],[0,0,0]]
	init=true
	pass
	
	
	
func testing_self_setup():
	for i in range(1,4):
		for k in range(0,6-i):
			setup_card_pile(i,k,i+k)
	
func setup_card_pile(tier:int, position:int, card_num:int):
	if !init:
		get_card_reference()
	if tier == 1 and (position>4 or position<0):
		return
	if tier == 2 and (position>3 or position<0):
		return
		
	if tier == 3 and (position>2 or position<0):
		return
	
	CardList_CardValue[tier-1][position] = card_num
	Utils.cardLoader(CardList[tier-1][position], card_num)

	pass
