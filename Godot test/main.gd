extends Node2D
class_name GameController

signal GUIMasterLoadComplete
signal PhaseChangeRequest(Request_Current_Phase, Request_Next_Phase)

signal ClickToken(Token_Position:TokenArray)
signal TakeTokenRequest(Token_Position:TokenArray)

signal CardPurchasableCheckRequest(SelectedCard)
signal PurchaseCardRequest(SelectedCard)
signal ReserveCardRequest(SelectedCard)
signal CardTakenAnimationFinishCallback(tier, Pos)
signal CardRefillAnimationFinishCallback(tier, Pos)

@export var PlayerBanner1: Node 
@export var PlayerBanner2: Node
@export var Board: Node
@export var CardPile: Node
@export var ConfirmButton: Node
@export var CancelButton: Node
@export var ButtonBar: Node
@export var BannerController: Node
@export var CardAnimationController: Node
@export var PopupController: Node
@export var MessageController: Node
@export var CardLookup: Node

var CurrentPlayer










#Region: Player Banner Calls---------------------------------------------------------------
func SetCurrentPlayer(player:int):
	CurrentPlayer=player

func GetBannerToUse(player:int):
	if player==0:
		return PlayerBanner1
	else:
		return PlayerBanner2

func SetBannerName(player: int, name: String):
	var PlayerBanner: Node
	if player!=0 and player!=1:
		return
	if !name:
		return
	PlayerBanner = GetBannerToUse(player)
	if player==0:		
		name == "[left]"+name+"[/left]"
	else:
		name == "[right]"+name+"[/right]"
	PlayerBanner.setPlayerName(name)
	
	
# the input should be [Enums.TokenColour.Red, 3] per every array element
func SetBannerTokenByArray(player:int, TokenArray: Array):
	for Modify in TokenArray:
		SetBannerToken(player, Modify)
func SetBannerToken(player, ModifyBannerToken):
	var PlayerBanner: Node
	if player!=0 and player!=1:
		return
	if !name:
		return
	PlayerBanner = GetBannerToUse(player)
	PlayerBanner.setPlayerTokenCount(ModifyBannerToken[0], ModifyBannerToken[1])
	
func SetBannerBonusByArray(player:int, BonusArray: Array):
	for Modify in BonusArray:
		SetBannerBonus(player, Modify)
func SetBannerBonus(player:int, ModifyBonusToken):
	var PlayerBanner: Node
	if player!=0 and player!=1:
		return
	if !name:
		return
	PlayerBanner = GetBannerToUse(player)
	PlayerBanner.setPlayerBonusCount(ModifyBonusToken[0], ModifyBonusToken[1])
	
func SetBannerPriv(player:int, PrivCount):
	var PlayerBanner: Node
	if player!=0 and player!=1:
		return
	if !name:
		return
	PlayerBanner = GetBannerToUse(player)
	PlayerBanner.setPlayerPrivCount(PrivCount)
	
func SetBannerScore(player:int, Score):
	var PlayerBanner: Node
	if player!=0 and player!=1:
		return
	if !name:
		return
	PlayerBanner = GetBannerToUse(player)
	PlayerBanner.setPlayerScore(Score)
	
func SetBannerCrown(player:int, CrownCount):
	var PlayerBanner: Node
	if player!=0 and player!=1:
		return
	if !name:
		return
	PlayerBanner = GetBannerToUse(player)
	PlayerBanner.setPlayerCrownCount(CrownCount)
	
func PushReserveCard(player:int, Tier:int, visibility:bool):
	var PlayerBanner: Node
	if player!=0 and player!=1:
		return
	if !name:
		return
	PlayerBanner = GetBannerToUse(player)
	PlayerBanner.pushTierCardList(Tier)
func RemoveReserveCard(player:int, Tier:int, visibility:bool):
	var PlayerBanner: Node
	if player!=0 and player!=1:
		return
	if !name:
		return
	PlayerBanner = GetBannerToUse(player)
	PlayerBanner.popTierCardList(Tier)
#End Region: Player Banner Calls---------------------------------------------------------------

















#Region: Token Board Calls-------------------------------------------
#Note: Index of board is x-axis 0 to 4, y-axis 0 to 4
func TakeThreeToken(TokenArrayElement:TokenArray):
	if len(TokenArrayElement.TokenArray)!=3:
		return
	print(TokenArrayElement)
	for i in range(3):
		if Board:
			Board.sendTokenToPlayer(TokenArrayElement.TokenArray[i].TokenObject, CurrentPlayer)
	
func TakeOneToken(TokenArrayElement):
	Board.sendTokenToPlayer(TokenArrayElement.TokenArray[0].TokenObject, CurrentPlayer)
	
func RefillTokenBoardByArray(TokenArrayElement:TokenArray, animation: bool=false):
	for element in TokenArrayElement.TokenArray:
		Board.fillSingleSlot(element.Position[1], element.Position[0], element.Colour, animation)
#endRegion of Token board-----------------------------------------------------------------

















#Region: Card Pile Calls--------------------------------------
#Sets The Card Details
func SetCardNum(tier: int, position: int, card_no:int):
	CardPile.setup_card_pile(tier, position, card_no)
func SetCardNumByArray(CardArray):
	for element in CardArray:
		CardPile.setup_card_pile(element[0], element[1], element[2])
#Utility To Search A Card's Position based on given Card_No
func SearchCardPosition(card_no):
	var Card_Info = CardPile.CardList_CardValue
	var found_location=false
	var tierNum
	var Pos
	for i in len(Card_Info):
		for j in len(Card_Info[i]):
			if Card_Info[i][j] == card_no:
				found_location=true
				tierNum = i+1
				Pos = j
				return([tierNum, Pos])
				break
				
	if found_location==false:
		return([-1, -1])
	return([-1, -1])
	
	
#Take A Card To Player
func SendCardToPlayer(card_no, player):
	var SearchCardResult = SearchCardPosition(card_no)
	if SearchCardResult[0] == -1:
		return
	var tier = SearchCardResult[0]
	var Pos = SearchCardResult[1]
	CardAnimationController.MoveCardToPosition(CurrentPlayer, tier, Pos)

#Move A Tier Card to position and fade
func PushNewCard(tier:int=-1, pos:int = -1):
	#omitting tier and pos will trigger auto-find slot
	if tier+pos == -2:
		var Card_Info = CardPile.CardList_CardValue
		var found_location=false
		for i in len(Card_Info):
			for j in len(Card_Info[i]):
				if Card_Info[i][j].get_parent().get_node("Button").visible==false:
					found_location=true
					tier = i+1
					pos = j
					break
		if found_location==false:
			return
			
	CardAnimationController.MoveTierCardToPosition(tier, pos)
	pass




func ShowCardPopupWindow(card_no, popupState: Enums.CardPopupState):
	var card_popup_window = PopupController.get_node("Card_Popup")
	card_popup_window.AlterPopupState(popupState)
	card_popup_window.SetupPopupWindow(card_no)
	card_popup_window.ShowPopupWindow()
func HideCardPopupWindow():
	var card_popup_window = PopupController.get_node("Card_Popup")
	card_popup_window.HidePopupWindow()
	
	
	
#signal related
func RequestCardPopup(card_No):
	CardPurchasableCheckRequest.emit(card_No)
func RequestPurchaseCard(card_No):
	PurchaseCardRequest.emit(card_No)
func RequestReserveCard(card_No):
	ReserveCardRequest.emit(card_No)
func FinishCardToPlayerAnim(tier, Pos):
	CardTakenAnimationFinishCallback.emit(tier, Pos)
func FinishTierToSlotAnim(tier, Pos):
	CardRefillAnimationFinishCallback.emit(tier, Pos)
#signal related
#Region: End of Card Pile Calls----------------------------



# Called when the node enters the scene tree for the first time.
func _ready():
	SetCurrentPlayer(1)
	
	SetCardNumByArray([[1, 0, 1],[1, 1, 2],[1, 2, 3],[1,3,4],[1,4,5], [2,0,10], [2,1,11], [2,2,12], [2,3,13], [3,0,21], [3,1,22], [3,2,23]])
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



