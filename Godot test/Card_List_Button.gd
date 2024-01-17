extends Button

var Card_Sibling
var CardListController
var PopupWindow
# Called when the node enters the scene tree for the first time.
func init_ref():
	var P1 = self.get_parent()
	var P2 = P1.get_parent()
	#print(P2)
	var P3 = P2.get_parent()
	CardListController = P3
	Card_Sibling = P1.get_node("Card_Base")
	PopupWindow = CardListController.get_node("Card_Popup")
	#print("Finish ref")
	
func _ready():
	init_ref()
	self.connect("mouse_entered", onFocus)
	self.connect("mouse_exited", onExit)
	self.connect("pressed", onPress)
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onFocus():
	#print(CardListController)
	CardListController.add_focus(Card_Sibling._card_ins.CardNum)
	pass
func onExit():
	CardListController.remove_focus(Card_Sibling._card_ins.CardNum)
	
func onPress():
	PopupWindow.SetupPopupWindow(Card_Sibling._card_ins.CardNum)
	PopupWindow.ShowPopupWindow()
	
	
	
