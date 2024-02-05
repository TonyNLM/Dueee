extends Node2D
class_name GameController

signal GUIMasterLoadComplete
signal PhaseChangeRequest(Request_Current_Phase, Request_Next_Phase)
signal CardPurchasableCheckRequest(SelectedCard)
signal ClickToken(Token_Position:TokenArray)
signal TakeTokenRequest(Token_Position:TokenArray)
signal PurchaseCard(SelectedCard, SelectedCardPosition)
signal ReserveCard(SelectedCard, SelectedCardPostion)

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

func TakeThreeToken(TokenArrayElement):
	if len(TokenArrayElement.TokenArray)!=3:
		return
	print(TokenArrayElement)
	for i in range(3):
		if Board:
			Board.sendTokenToPlayer(TokenArrayElement.TokenArray[i].TokenObject, CurrentPlayer)
	





# Called when the node enters the scene tree for the first time.
func _ready():
	SetCurrentPlayer(1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



