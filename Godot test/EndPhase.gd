extends Node

var PhaseMaster
const State = Enums.PlayerPhase.End
var LatestResponse

func _ready():
	PhaseMaster=self.get_parent()
# Called when the node enters the scene tree for the first time.
func enter(Response: Classes.FSM_Phase_Response_Object):
	PhaseMaster.GUIMasterController.AlterSelectionMode(Enums.SelectionMode.SelectZero)
	LatestResponse=Response
	if Response.IsPlayerTurn == true:
		PhaseMaster.AnimationController.ChangePhaseTextTo("End Phase")
		PhaseMaster.InstructionIndicator.text = "It's End of the Turn"
		PhaseMaster.ConfirmButton.get_node("Button_Text").text = "[center]Proceed[center]"
		PhaseMaster.CancelButton.get_node("Button_Text").text = "[center]---[center]"
		PhaseMaster.ConfirmButton.get_node("Button_Icon").connect("pressed", ConfirmButtonHandler)
	pass

	
func exit():
	PhaseMaster.ConfirmButton.get_node("Button_Icon").disconnect("pressed", ConfirmButtonHandler)
	pass
	
	
func ConfirmButtonHandler():
	PhaseMaster.GUIMasterController.RequestNextPhase(State)
