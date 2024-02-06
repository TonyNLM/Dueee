extends Node

var PhaseMaster
const State = Enums.PlayerPhase.Start
var LatestResponse

func _ready():
	PhaseMaster=self.get_parent()
# Called when the node enters the scene tree for the first time.
func enter(Response: Classes.FSM_Phase_Response_Object):
	LatestResponse=Response
	if Response.IsPlayerTurn == true:
		PhaseMaster.AnimationController.ChangePhaseTextTo("Your Turn")
		PhaseMaster.InstructionIndicator.text = "It's Your Turn"
		PhaseMaster.ConfirmButton.get_node("Button_Text").text = "[center]Proceed[center]"
		PhaseMaster.CancelButton.get_node("Button_Text").text = "[center]---[center]"
		PhaseMaster.ConfirmButton.get_node("Button_Icon").connect("pressed", ConfirmButtonHandler)
	pass

	
func exit():
	PhaseMaster.ConfirmButton.get_node("Button_Icon").disconnect("pressed", ConfirmButtonHandler)
	pass
	
	
func ConfirmButtonHandler():
	PhaseMaster.GUIMasterController.RequestNextPhase(State)
