extends Node

var PhaseMaster
const State = Enums.PlayerPhase.Priv
var LatestResponse

func _ready():
	PhaseMaster=self.get_parent()
# Called when the node enters the scene tree for the first time.
func enter(Response: Classes.FSM_Phase_Response_Object):
	LatestResponse=Response
	if Response.IsPlayerTurn == true:
		PhaseMaster.AnimationController.ChangePhaseTextTo("Refill")
		PhaseMaster.GUIMasterController.AlterSelectionMode(Enums.SelectionMode.SelectOne)
		
		if Response.TurnIsSkippable == true:
			
			PhaseMaster.InstructionIndicator.text = "You have no Privelege to Spend"
			PhaseMaster.ConfirmButton.get_node("Button_Text").text = "[center]---[center]"
			PhaseMaster.CancelButton.get_node("Button_Text").text = "[center]Skip[center]"
			PhaseMaster.CancelButton.get_node("Button_Icon").connect("pressed", SkipCancelButtonHandler)
		else:
			
			PhaseMaster.InstructionIndicator.text = "Spend Privelege and take token?"
			PhaseMaster.ConfirmButton.get_node("Button_Text").text = "[center]Take[center]"
			PhaseMaster.CancelButton.get_node("Button_Text").text = "[center]Skip[center]"
			PhaseMaster.ConfirmButton.get_node("Button_Icon").connect("pressed", ConfirmButtonHandler)
			PhaseMaster.CancelButton.get_node("Button_Icon").connect("pressed", SkipCancelButtonHandler)
	pass

	
func exit():
	PhaseMaster.ConfirmButton.get_node("Button_Icon").disconnect("pressed", ConfirmButtonHandler)
	PhaseMaster.CancelButton.get_node("Button_Icon").disconnect("pressed", SkipCancelButtonHandler)
	pass
	
	
func ConfirmButtonHandler():
	PhaseMaster.GUIMasterController.Board.RequestTakeAwayToken()
	pass
	
func SkipCancelButtonHandler():
	PhaseMaster.GUIMasterController.RequestNextPhase(State)
