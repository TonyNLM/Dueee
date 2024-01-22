extends VBoxContainer


var FocusList:Array
var Focus

var CardList_CardValue
var CardList
var init
# Called when the node enters the scene tree for the first time.
func _ready():
	
	init_self()
	testing_self_setup()
	
	
func init_self():
	if !init:
		get_card_reference()
	FocusList = []
	
	Focus=false
	$Card_Enlarge.visible = false
	#$Card_Enlarge.MOUSE_FILTER_IGNORE = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Focus:
		var mouse_position = get_local_mouse_position()
		var offset_x = -300
		var offset_y =-300
		mouse_position.x+=offset_x
		mouse_position.y+=offset_y
		$Card_Enlarge.position = mouse_position
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
			print(CardList[i-1][k].global_position)
			print(CardList[i-1][k])
			#if i==2:
				#CardList[i-1][k].global_position=Vector2(0,0)
	
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
	CardList[tier-1][position]._card_ins.cardLoader(card_num)
	
	
	pass


func add_focus(num:int):
	if !Focus:
		Focus=true
		$Card_Enlarge.visible=true
		FocusList.append(num)
	else:
		FocusList.append(num)
	$Card_Enlarge._card_ins.cardLoader(num)
	
func remove_focus(num:int):
	if FocusList.size()>0 and FocusList[0]!=num:
		return
	Focus=false
	$Card_Enlarge.visible=false
	if FocusList.size()>0:
		FocusList=[]
	
	
func force_remove_focus():
	Focus=false
	$Card_Enlarge.visible=false
	if FocusList.size()>0:
		FocusList=[]
