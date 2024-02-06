extends Node2D


var Noble = preload("res://classes.gd").Noble
var Skill
@export var NobleID:int
var noble



func _ready():
	init_self()

func init_self():
	noble=Noble.new()
	noble.NobleObject = self
	noble.NobleID = NobleID
	noble.Noble_init()
	noble.nobleLoader(NobleID)

