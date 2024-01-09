extends Node2D

var YellowHighlightState: bool
var YellowHighlightIntensity: int
var YellowHighlightIntensityModifier: int
var WhiteHighlightState: bool
var WhiteHighlightIntensity: int
var WhiteHighlightIntensityModifier: int

# Called when the node enters the scene tree for the first time.
func _ready():
	YellowHighlightIntensity = 0
	YellowHighlightState = false
	WhiteHighlightIntensity = 0
	WhiteHighlightState = false
	YellowHighlightIntensityModifier = 3
	WhiteHighlightIntensityModifier = 3
	
	#YellowHighlightSwitch(true)
	#WhiteHighlightSwitch(true)
	
	$Board_Button.connect("mouse_entered",self._on_Board_Button_mouse_entered)
	$Board_Button.connect("mouse_exited", self._on_Board_Button_mouse_exited)
	$Board_Button.connect("pressed", self._on_Board_Button_pressed)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if YellowHighlightState:
		if YellowHighlightIntensity >= 180:
			YellowHighlightIntensityModifier = -3
		if YellowHighlightIntensity <= 40:
			YellowHighlightIntensityModifier = 3
		YellowHighlightIntensity += YellowHighlightIntensityModifier
		
		var yellowHighlightColor = Color(1, 1, 0, YellowHighlightIntensity / 255.0)
		$YellowHighlight.modulate = yellowHighlightColor
	
	if WhiteHighlightState:
		if WhiteHighlightIntensity >= 180:
			WhiteHighlightIntensityModifier = -3
		if WhiteHighlightIntensity <= 40:
			WhiteHighlightIntensityModifier = 3
		WhiteHighlightIntensity += WhiteHighlightIntensityModifier
		
		var whiteHighlightColor = Color(1, 1, 1, WhiteHighlightIntensity / 255.0)
		$WhiteHighlight.modulate = whiteHighlightColor
	
	pass

func YellowHighlightSwitch(switch: bool):
	if switch and !YellowHighlightState:
		YellowHighlightIntensity = 0
		$YellowHighlight.visible = true
		$YellowHighlight.modulate = Color(1, 1, 0, YellowHighlightIntensity / 255.0)
		YellowHighlightState = true
		print("Yellow highlight turned on")
	if !switch and YellowHighlightState:
		YellowHighlightIntensity = 0
		$YellowHighlight.visible = false
		$YellowHighlight.modulate = Color(1, 1, 0, YellowHighlightIntensity / 255.0)
		YellowHighlightState = false
		print("Yellow highlight turned off")

func WhiteHighlightSwitch(switch: bool):
	if switch and !WhiteHighlightState:
		WhiteHighlightIntensity = 0
		$WhiteHighlight.visible = true
		$WhiteHighlight.modulate = Color(1, 1, 1, WhiteHighlightIntensity / 255.0)
		WhiteHighlightState = true
		print("White highlight turned on")
	if !switch and WhiteHighlightState:
		WhiteHighlightIntensity = 0
		$WhiteHighlight.visible = false
		$WhiteHighlight.modulate = Color(1, 1, 1, WhiteHighlightIntensity / 255.0)
		WhiteHighlightState = false
		print("White highlight turned off")

func _on_Board_Button_mouse_entered():
	WhiteHighlightSwitch(true)
	print("White light on")

func _on_Board_Button_mouse_exited():
	WhiteHighlightSwitch(false)
	print("White Light Off")

func _on_Board_Button_pressed():
	if YellowHighlightState:
		YellowHighlightSwitch(false)
	else:
		YellowHighlightSwitch(true)
	print("Yellow light toggled")
	
	
	
func turnOffAllLights():
	WhiteHighlightIntensity = 0
	$WhiteHighlight.visible = false
	$WhiteHighlight.modulate = Color(1, 1, 1, WhiteHighlightIntensity / 255.0)
	WhiteHighlightState = false
	print("White highlight turned off")
	YellowHighlightIntensity = 0
	$YellowHighlight.visible = false
	$YellowHighlight.modulate = Color(1, 1, 0, YellowHighlightIntensity / 255.0)
	YellowHighlightState = false
	print("Yellow highlight turned off")
	
func EnableLights(switch:bool):
	if switch:
		$Board_Button.visible = true
	else:
		$Board_Button.visible = false
		turnOffAllLights()
