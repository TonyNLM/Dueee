extends Node2D


var Noble = preload("res://classes.gd").Noble
var noble
var init


func _ready():
	init_self()

func init_self():
	noble=Noble.new()
	noble.NobleObject = self
	noble.Noble_init()
	init = noble.init
