extends Node

var PhaseMaster
const State = Enums.PlayerPhase.Skill
var LatestResponse

func _ready():
	PhaseMaster=self.get_parent()
# Called when the node enters the scene tree for the first time.
func enter(Response: Classes.FSM_Phase_Response_Object):
	LatestResponse=Response
	if Response.IsPlayerTurn == true:
		PhaseMaster.AnimationController.ChangePhaseTextTo("Card Skill")
		PhaseMaster.GUIMasterController.AlterSelectionMode(Enums.SelectionMode.SelectThree)
		
		if Response.TurnIsSkippable == true:
			PhaseMaster.GUIMasterController.RequestNextPhase(State)
			#PhaseMaster.ConfirmButton.get_node("Button_Icon").connect("pressed", ConfirmButtonHandler)
			#PhaseMaster.CancelButton.get_node("Button_Icon").connect("pressed", SkipCancelButtonHandler)
		else:
			if Response.PlayerAction == "StealToken":
				PhaseMaster.PopupController.get_node("StealToken_Popup").ShowWindow([0,1,2])
				
			
	pass

	
func exit():

	pass
