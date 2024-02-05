extends Node2D


var TokenCountItems
var colourSequence = [Enums.TokenColour.Red,Enums.TokenColour.Blue,Enums.TokenColour.Green,Enums.TokenColour.White,Enums.TokenColour.Black,Enums.TokenColour.Pink,Enums.TokenColour.Gold]
var colourSequenceDict = {Enums.TokenColour.Red: 0,Enums.TokenColour.Blue:1,Enums.TokenColour.Green:2,Enums.TokenColour.White:3,Enums.TokenColour.Black:4,Enums.TokenColour.Pink:5,Enums.TokenColour.Gold:6 }

var Priv_Stack_Elements
var Reserve_Stack_Elements

var Reserve_Stack_Tier_List
# Called when the node enters the scene tree for the first time.
func _ready():
	
	#init
	TokenCountItems = [$Token_and_Bonus/PlayerTokenCount0/Cost_Parent, $Token_and_Bonus/PlayerTokenCount1/Cost_Parent, $Token_and_Bonus/PlayerTokenCount2/Cost_Parent, $Token_and_Bonus/PlayerTokenCount3/Cost_Parent, $Token_and_Bonus/PlayerTokenCount4/Cost_Parent, $Token_and_Bonus/PlayerTokenCount5/Cost_Parent, $Token_and_Bonus/PlayerTokenCount6/Cost_Parent]
	Priv_Stack_Elements = {1:$Priv_Stack/Priv1/Sprite2D,2:$Priv_Stack/Priv2/Sprite2D,3:$Priv_Stack/Priv3/Sprite2D}
	Reserve_Stack_Elements = [$Reserve_Parent/ReserveSlot1/TierCardBack,$Reserve_Parent/ReserveSlot2/TierCardBack,$Reserve_Parent/ReserveSlot3/TierCardBack]
	Reserve_Stack_Tier_List = [[0,false],[0,false],[0,false]]
	changeReserveCardTextureByArray(Reserve_Stack_Tier_List)
	setPlayerScore(0)
	setPlayerPrivCount(0)
	setPlayerName("test")
	setPlayerCrownCount((0))
	#end init
	
	initialize_Token_and_Bonus()
	
	#setPlayerBonusCount(Enums.TokenColour.Blue, 4)
	#setPlayerTokenCount(Enums.TokenColour.Blue, 5)
	
	pushTierCardList(1, true)
	pushTierCardList(2, true)
	pushTierCardList(3)
	popTierCardList(2, true)
	pushTierCardList(3, true)
	pass # Replace with function body.





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func initialize_Token_and_Bonus():
	for i in range(7):
		TokenCountItems[i].changeCostColour(colourSequence[i])
		TokenCountItems[i].changeCostText(0)
		var Bonus = TokenCountItems[i].get_node("Cost_Bonus")
		Bonus.text = ""
		if i == 3 or i == 6:
			Bonus.set("theme_override_colors/default_color", Color(0,0,0))
			
	pass
	



func setPlayerTokenCount(colour:Enums.TokenColour, count:int):
	var PlayerTokenCount = TokenCountItems[colourSequenceDict[colour]]
	PlayerTokenCount.changeCostText(count)
	
func setPlayerBonusCount(colour:Enums.TokenColour, count:int):
	var PlayerBonusCount = TokenCountItems[colourSequenceDict[colour]].get_node("Cost_Bonus")
	
	if count != 0:
		PlayerBonusCount.text = "+"+str(count)
	else:
		PlayerBonusCount.text = ""
	
func setPlayerPrivCount(count:int):
	if count<0 or count>3:
		return
	if count==3:
		Priv_Stack_Elements[1].visible=true
		Priv_Stack_Elements[2].visible=true
		Priv_Stack_Elements[3].visible=true
	if count==2:
		Priv_Stack_Elements[1].visible=true
		Priv_Stack_Elements[2].visible=true
		Priv_Stack_Elements[3].visible=false
	if count==1:
		Priv_Stack_Elements[1].visible=true
		Priv_Stack_Elements[2].visible=false
		Priv_Stack_Elements[3].visible=false
	if count==0:
		Priv_Stack_Elements[1].visible=false
		Priv_Stack_Elements[2].visible=false
		Priv_Stack_Elements[3].visible=false
		
	
func setPlayerScore(score:int):
	if score<0:
		return
	$PlayerScore/CardPoints.text = str(score)
	
func setPlayerName(Playername:String):
	$PlayerName.text = Playername
	
func setPlayerCrownCount(count:int):
	$Crown_Base/Crown_Count.text= str(count)
	
	
	
	
	
	
	
#Function for reserve cards
	
func pushTierCardList(tier:int, visibility:bool=false):
	var i=0
	var found_position=false
	##print(Reserve_Stack_Tier_List)
	while(i<3 and found_position == false):
		##print(Reserve_Stack_Tier_List[i])
		if Reserve_Stack_Tier_List[i][0]==0:
			found_position = true
			
		else:
			i+=1
		
	if found_position == false:
		##print("Failed To Reserve Card")
		return
	Reserve_Stack_Tier_List[i]=[tier, visibility]
	changeReserveCardTexture(i, tier, visibility)
		
		
		
func popTierCardList(tier:int, visibility:bool=false):
	var i=0
	var found_position=false
	while(i<3):
		if found_position == true:
			Reserve_Stack_Tier_List[i-1] = Reserve_Stack_Tier_List[i]
		if Reserve_Stack_Tier_List[i][0]==tier and Reserve_Stack_Tier_List[i][1]==visibility:
			found_position = true
		
		
			
		i+=1
		
	if found_position == false:
		##print("Failed To Purchase Reserved Card")
		return

	Reserve_Stack_Tier_List[2]=[0,false]
	changeReserveCardTextureByArray(Reserve_Stack_Tier_List)

		
	

func changeReserveCardTextureByArray(Tier_List:Array):
	for i in range(3):
		changeReserveCardTexture(i, Tier_List[i][0], Tier_List[i][1])
	pass

func changeReserveCardTexture(slot: int, tier:int, visibility:bool=false):
	if tier<0 or tier>3:
		return
	if visibility==true:
		Reserve_Stack_Elements[slot].get_node("EyeIcon").visible=true
	else:
		Reserve_Stack_Elements[slot].get_node("EyeIcon").visible=false
	if tier==0:
		Reserve_Stack_Elements[slot].visible = false
		return
	Reserve_Stack_Elements[slot].visible = true
	#call on child
	Reserve_Stack_Elements[slot].ChangeTierCardBack(tier)
	

#end of function for reserve cards
		
