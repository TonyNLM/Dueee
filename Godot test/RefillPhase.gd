extends Node

var PhaseMaster
const State = Enums.PlayerPhase.Refill
var LatestResponse

func _ready():
	PhaseMaster=self.get_parent()
# Called when the node enters the scene tree for the first time.
func enter(Response: Classes.FSM_Phase_Response_Object):
	LatestResponse=Response
	if Response.IsPlayerTurn == true:
		PhaseMaster.AnimationController.ChangePhaseTextTo("Refill")
		PhaseMaster.GUIMasterController.AlterSelectionMode(Enums.SelectionMode.SelectZero)
		
		if Response.TurnIsSkippable == true:
			
			PhaseMaster.InstructionIndicator.text = "You Must Refill The Board"
			PhaseMaster.ConfirmButton.get_node("Button_Text").text = "[center]Refill[center]"
			PhaseMaster.CancelButton.get_node("Button_Text").text = "[center]---[center]"
			PhaseMaster.ConfirmButton.get_node("Button_Icon").connect("pressed", ConfirmButtonHandler)
			#PhaseMaster.CancelButton.get_node("Button_Icon").connect("pressed", SkipCancelButtonHandler)
		else:
			
			PhaseMaster.InstructionIndicator.text = "Refill The Board?"
			PhaseMaster.ConfirmButton.get_node("Button_Text").text = "[center]Refill[center]"
			PhaseMaster.CancelButton.get_node("Button_Text").text = "[center]Skip[center]"
			PhaseMaster.ConfirmButton.get_node("Button_Icon").connect("pressed", ConfirmButtonHandler)
			PhaseMaster.CancelButton.get_node("Button_Icon").connect("pressed", SkipCancelButtonHandler)
	pass

	
func exit():
	PhaseMaster.ConfirmButton.get_node("Button_Icon").disconnect("pressed", ConfirmButtonHandler)
	PhaseMaster.CancelButton.get_node("Button_Icon").disconnect("pressed", SkipCancelButtonHandler)
	pass
	
	
func ConfirmButtonHandler():
	PhaseMaster.GUIMasterController.Board.Test_FillAllSlot()
	PhaseMaster.GUIMasterController.RequestNextPhase(State)
	pass
	
func SkipCancelButtonHandler():
	PhaseMaster.GUIMasterController.RequestNextPhase(State)
