extends Node
#Created for ease to transfer token values and objects
class_name TokenArray
var TokenArray = []
func AddNewTokenRecord(ElementPointer:Node):
	var newTokenElement = TokenArrayElement.new()
	newTokenElement.self_init(ElementPointer)
	TokenArray.append(newTokenElement)
	pass
	
	
class TokenArrayElement:
	var Position
	var Colour
	var TokenObject
	func self_init(ElementPointer):
		Position = ElementPointer.BoardTokenPosition
		Colour = ElementPointer.TokenColour
		TokenObject = ElementPointer
	
