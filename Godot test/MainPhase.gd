extends Node

var PhaseMaster
const State = Enums.PlayerPhase.Main
var LatestResponse

func _ready():
	PhaseMaster=self.get_parent()
# Called when the node enters the scene tree for the first time.
func enter(Response: Classes.FSM_Phase_Response_Object):
	LatestResponse=Response
	if Response.IsPlayerTurn == true:
		PhaseMaster.AnimationController.ChangePhaseTextTo("Main Phase")
		PhaseMaster.GUIMasterController.AlterSelectionMode(Enums.SelectionMode.SelectThree)
		
		if Response.TurnIsSkippable == true:
			PhaseMaster.GUIMasterController.AlterSelectionMode(Enums.SelectionMode.SelectZero)
			PhaseMaster.InstructionIndicator.text = "You Have No Actions To Be Peformed"
			PhaseMaster.ConfirmButton.get_node("Button_Text").text = "[center]---[center]"
			PhaseMaster.CancelButton.get_node("Button_Text").text = "[center]Skip[center]"
			#PhaseMaster.ConfirmButton.get_node("Button_Icon").connect("pressed", ConfirmButtonHandler)
			#PhaseMaster.CancelButton.get_node("Button_Icon").connect("pressed", SkipCancelButtonHandler)
		else:
			
			PhaseMaster.InstructionIndicator.text = "Purchase/Reserve/Take Token"
			PhaseMaster.ConfirmButton.get_node("Button_Text").text = "[center]Choose[center]"
			PhaseMaster.CancelButton.get_node("Button_Text").text = "[center]Reset[center]"
			PhaseMaster.ConfirmButton.get_node("Button_Icon").connect("pressed", ConfirmButtonHandler)
			PhaseMaster.CancelButton.get_node("Button_Icon").connect("pressed", ResetTokenSelectionButtonHandler)
	pass

	
func exit():
	PhaseMaster.ConfirmButton.get_node("Button_Icon").disconnect("pressed", ConfirmButtonHandler)
	PhaseMaster.CancelButton.get_node("Button_Icon").disconnect("pressed", SkipCancelButtonHandler)
	PhaseMaster.CancelButton.get_node("Button_Icon").disconnect("pressed", ResetTokenSelectionButtonHandler)
	pass
	
	

	
func SkipCancelButtonHandler():
	PhaseMaster.GUIMasterController.RequestNextPhase(State)
	
	
func ConfirmButtonHandler():
	PhaseMaster.GUIMasterController.Board.RequestTakeAwayToken()
	pass
func ResetTokenSelectionButtonHandler():
	PhaseMaster.GUIMasterController.Board.ClearAllSelectedToken()
