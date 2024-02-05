extends Node

var GUIMasterController
# Called when the node enters the scene tree for the first time.
func _ready():
	GUIMasterController = get_parent()
	GUIMasterController.TakeTokenRequest.connect(ListenToCollectToken)
	GUIMasterController.ClickToken.connect(ListenToTokenClick)
	GUIMasterController.CardPurchasableCheckRequest.connect(ListenToPopupRequest)
	GUIMasterController.PurchaseCardRequest.connect(ListenToPurchaseRequest)
	GUIMasterController.ReserveCardRequest.connect(ListenToReserveRequest)
	GUIMasterController.CardTakenAnimationFinishCallback.connect(ListenToTakeCardAnimComplete)
	pass # Replace with function body.

func ListenToTokenClick(TokenClickEvent: TokenArray):
	print(TokenClickEvent.TokenArray[0].Position)
	
func ListenToCollectToken(TokenRequestTakeEvent: TokenArray):
	var logic = true
	if logic:
		GUIMasterController.TakeThreeToken(TokenRequestTakeEvent)
		
func ListenToPopupRequest(card_Num):
	var rand = randi() % 5
	GUIMasterController.ShowCardPopupWindow(card_Num, rand)
	print("State is"+str(rand))

func ListenToPurchaseRequest(card_Num):
	GUIMasterController.HideCardPopupWindow()
	GUIMasterController.SendCardToPlayer(card_Num, GUIMasterController.CurrentPlayer)
	
func ListenToReserveRequest(card_Num):
	GUIMasterController.HideCardPopupWindow()
	GUIMasterController.SendCardToPlayer(card_Num, GUIMasterController.CurrentPlayer)
	
func ListenToTakeCardAnimComplete(tier, pos):
	GUIMasterController.HideCardPopupWindow()
	GUIMasterController.SetCardNum(tier, pos, randi() % 20)
	GUIMasterController.PushNewCard(tier, pos)
