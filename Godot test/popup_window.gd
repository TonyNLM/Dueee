extends Node2D

var Card: Node
var Card_Crown_Base: Node
var Crown_Image_Holder

# Called when the node enters the scene tree for the first time.
func _ready():
	var Purchase_Button = get_node("PurchaseButton/Button_Icon")
	var Reserve_Button = get_node("ReserveButton/Button_Icon")
	print(Purchase_Button)
	var Close_Button = get_node("Close_Button")
	Card = get_node("Card_Base") as Node
	Card_Crown_Base = Card.get_node("Crown_Base")	
	Purchase_Button.pressed.connect(self.Purchase_Button_Handler)
	Reserve_Button.pressed.connect(self.Reserve_Button_Handler)
	Close_Button.pressed.connect(self.Close_Button_Handler)
	print("Finished Startup")
	pass # Replace with function body.

func Purchase_Button_Handler():
	var Crown_Image_Holder = Card.get_node("Crown_Base/Crown_Image_Holder") as Node2D
	print(Crown_Image_Holder)
	var currentCrownCount = Crown_Image_Holder.getCrownNum()
	Crown_Image_Holder.setCrownImage(currentCrownCount-1)
	print("CrownNumberIs:"+str(Crown_Image_Holder.getCrownNum()))

	pass

func Reserve_Button_Handler():
	var Crown_Image_Holder = Card.get_node("Crown_Base/Crown_Image_Holder") as Node2D
	print(Crown_Image_Holder)
	var currentCrownCount = Crown_Image_Holder.getCrownNum()
	Crown_Image_Holder.setCrownImage(currentCrownCount+1)
	print("CrownNumberIs:"+str(Crown_Image_Holder.getCrownNum()))

	pass
	
func Close_Button_Handler():
	get_tree().quit()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
