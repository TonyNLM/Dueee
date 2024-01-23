extends Control

var SizeChangeTween:Tween
var Banner
var init_Banner_size
var init_Banner_position
# Called when the node enters the scene tree for the first time.
func _ready():
	Banner = $Banner
	init_Banner_size = Banner.scale
	init_Banner_position = Banner.position
	$Banner/BannerZoomer.connect("button_down", EnlargeBanner)
	$Banner/Close_Button.connect("button_down", RevertBanner)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func EnlargeBanner():
	if SizeChangeTween:
		SizeChangeTween.stop_all()
	Banner.scale = Vector2(0.8, 0.8)
	Banner.position = Vector2(600, 300)
	$Banner/Close_Button.visible=true

func RevertBanner():
	if SizeChangeTween:
		SizeChangeTween.stop_all()
	Banner.scale = init_Banner_size
	Banner.position = init_Banner_position
	$Banner/Close_Button.visible=false
