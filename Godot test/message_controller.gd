extends Control

static var Message_Controller_Instance
# Called when the node enters the scene tree for the first time.
func _ready():
	if Message_Controller_Instance==null:
		Message_Controller_Instance=self
		
	#pushMessage("Test Message")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	
static func pushMessage(message):
	Message_Controller_Instance.visible = true
	Message_Controller_Instance.modulate.a=1
	Utils.fadeOutObject(Message_Controller_Instance, 1, 2, false)
	message = '[center]'+message+'[/center]'
	var Message_TextField = Message_Controller_Instance.get_node("Message")
	Message_TextField.text = message
	

