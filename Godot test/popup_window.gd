extends Node2D

var Card_Base: Node
var Purchase_Button
var Reserve_Button
var Close_Button
var Popup_Container
var CardNum
var PopupState:Enums.CardPopupState
const Message_Controller = preload("res://message_controller.gd")

static var ButtonTexture = {0: preload("res://Fairy Pics/button.png"),1: preload("res://Fairy Pics/buttonpressed.png")}

# Called when the node enters the scene tree for the first time.
func _ready():
	Purchase_Button = get_node("PurchaseButton/Button_Icon")
	Reserve_Button = get_node("ReserveButton/Button_Icon")
	Close_Button = get_node("Close_Button")
	
	Card_Base = get_node("Card_Base") as Node
	
	
	Purchase_Button.pressed.connect(self.Purchase_Button_Handler)
	Reserve_Button.pressed.connect(self.Reserve_Button_Handler)
	Close_Button.pressed.connect(self.Close_Button_Handler)
	print("Finished Startup")
	pass # Replace with function body.

func Purchase_Button_Handler():
	if PopupState==Enums.CardPopupState.CanPurchase or PopupState==Enums.CardPopupState.CanReserveAndPurchase:
		print("Purchase Successful")
	elif PopupState==Enums.CardPopupState.NotPlayerTurn:
		Message_Controller.pushMessage("You cannot purchase in this phase")
	elif PopupState==Enums.CardPopupState.CanReserve or PopupState==Enums.CardPopupState.CannotReserveAndPurchase:
		Message_Controller.pushMessage("You cannot purchase this card")
	

	pass

func Reserve_Button_Handler():
	if PopupState == Enums.CardPopupState.CanReserve or PopupState == Enums.CardPopupState.CanReserveAndPurchase:
		print("Card Reserved")
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

func SetupPopupWindow(cardNum:int):
	Card_Base._card_ins.cardLoader(cardNum)
	
	var NewPopupState=RequestPopupState(1, cardNum)
	AlterPopupState(NewPopupState)
	print("New Popup State is now"+str(NewPopupState))
	pass
	
func AlterPopupState(popup_State:Enums.CardPopupState):
	if popup_State==PopupState:
		#print("Same"+str(popup_State)+str(PopupState))
		return
		
	print("Popup State is altered to"+str(popup_State))
	PopupState=popup_State
	match PopupState:
		Enums.CardPopupState.NotPlayerTurn:
			$PurchaseButton/Button_Icon.texture_normal = ButtonTexture[1]
			$ReserveButton/Button_Icon.texture_normal= ButtonTexture[1]
			print("per1")
		Enums.CardPopupState.CannotReserveAndPurchase:
			$PurchaseButton/Button_Icon.texture_normal = ButtonTexture[1]
			$ReserveButton/Button_Icon.texture_normal= ButtonTexture[1]

		Enums.CardPopupState.CanPurchase:
			$PurchaseButton/Button_Icon.texture_normal= ButtonTexture[0]
			$ReserveButton/Button_Icon.texture_normal = ButtonTexture[1]
			print("per2")

		Enums.CardPopupState.CanReserve:
			$PurchaseButton/Button_Icon.texture_normal = ButtonTexture[1]
			$ReserveButton/Button_Icon.texture_normal = ButtonTexture[0]
			print("per3")

		Enums.CardPopupState.CanReserveAndPurchase:
			$PurchaseButton/Button_Icon.texture_normal = ButtonTexture[0]
			$ReserveButton/Button_Icon.texture_normal = ButtonTexture[0]
			print("per4")

		
		
func RequestPopupState(playerNum:int, cardNum:int):
	# Note! this external feature is not implemented.
	var NewPopupState=cardNum%5
	print(PopupState)
	return NewPopupState
	pass
