extends Node
@export var PopupController:Node
@export var AnimationController:Node
@export var GUIMasterController:Node
@export var InstructionIndicator:Node
@export var ConfirmButton:Node
@export var CancelButton:Node


var CurrentPhase
var PhaseStateChild
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var init_response = Classes.FSM_Phase_Response_Object.new()
	PhaseStateChild = {Enums.PlayerPhase.Start: $StartPhase, Enums.PlayerPhase.Priv: 
$PrivPhase,Enums.PlayerPhase.Refill: $RefillPhase, Enums.PlayerPhase.Main: $MainPhase,Enums.PlayerPhase.Skill: $SkillPhase, Enums.PlayerPhase.Noble: $NoblePhase, Enums.PlayerPhase.End: $EndPhase}
	init_response.IsPlayerTurn = true
	CurrentPhase=Enums.PlayerPhase.Start
	$StartPhase.enter(init_response)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func ChangeState(Response: Classes.FSM_Phase_Response_Object):
	if CurrentPhase == Response.ChangePhaseTo:
		return
	
	PhaseStateChild[CurrentPhase].exit()
	PhaseStateChild[Response.ChangePhaseTo].enter(Response)
	CurrentPhase == Response.ChangePhaseTo
	pass	
