extends Node2D


var Card = preload("res://classes.gd").Card
var _card_ins
var init


func _ready():
	init_self()

func init_self():
	_card_ins=Card.new()
	_card_ins.CardObject = self
	_card_ins.Card_init()
	init = _card_ins.init
