extends Node2D


var TierCard: Node
var Tier
var Reserve_Button
var Close_Button
var Popup_Container
var TierNum
var PopupState:Enums.CardPopupState
const Message_Controller = preload("res://message_controller.gd")

static var TierImage = {1: preload("res://Fairy Pics/tier1CardBack.png"),2: preload("res://Fairy Pics/tier2CardBack.png"),3: preload("res://Fairy Pics/tier3CardBack.png")}
static var ButtonTexture = {0: preload("res://Fairy Pics/button.png"),1: preload("res://Fairy Pics/buttonpressed.png")}
# Called when the node enters the scene tree for the first time.
func _ready():

	Reserve_Button = get_node("ReserveButton/Button_Icon")
	Close_Button = get_node("Close_Button")
	
	TierCard = $Tier_Card
	
	Reserve_Button.pressed.connect(self.Reserve_Button_Handler)
	Close_Button.pressed.connect(self.Close_Button_Handler)
	##print("Finished Startup")
	pass # Replace with function body.



	pass

func Reserve_Button_Handler():
	if PopupState == Enums.CardPopupState.CanReserve or PopupState == Enums.CardPopupState.CanReserveAndPurchase:
		get_tree().call_group("GUIMasterController", "RequestBlindReserveTake", Tier)
		pass
		##print("Card Reserved")
	elif PopupState == Enums.CardPopupState.NotPlayerTurn:
		Message_Controller.pushMessage("You cannot reserve in this phase")
	elif PopupState == Enums.CardPopupState.CanPurchase or PopupState == Enums.CardPopupState.CannotReserveAndPurchase:
		Message_Controller.pushMessage("You cannot reserve this card")
	
func Close_Button_Handler():
	HidePopupWindow()
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func ShowPopupWindow():
	self.visible=true
	
func HidePopupWindow():
	self.visible=false

func SetupPopupWindow(tier:int):
	TierCard.texture= TierImage[tier]
	Tier = tier
	##print("New Popup State is now"+str(NewPopupState))
	pass
	
func AlterPopupState(popup_State:Enums.CardPopupState):
	if popup_State==PopupState:
		##print("Same"+str(popup_State)+str(PopupState))
		return
		
	##print("Popup State is altered to"+str(popup_State))
	PopupState=popup_State
	match PopupState:
		Enums.CardPopupState.NotPlayerTurn:

			$ReserveButton/Button_Icon.texture_normal= ButtonTexture[1]
			##print("per1")
		Enums.CardPopupState.CannotReserveAndPurchase:

			$ReserveButton/Button_Icon.texture_normal= ButtonTexture[1]

		Enums.CardPopupState.CanPurchase:

			$ReserveButton/Button_Icon.texture_normal = ButtonTexture[1]
			##print("per2")

		Enums.CardPopupState.CanReserve:

			$ReserveButton/Button_Icon.texture_normal = ButtonTexture[0]
			##print("per3")

		Enums.CardPopupState.CanReserveAndPurchase:

			$ReserveButton/Button_Icon.texture_normal = ButtonTexture[0]
			##print("per4")

func AlterRemainingCardPileCount(RemainingCard):
	$InfoText.text = "Remaining Cards In This Tier: "+ str(RemainingCard)
