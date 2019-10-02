extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"v
var a= true
var b=0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	pass
	
func play(sample_name):
	get_node("sample_player").play(sample_name)
	pass
func play_click():
	get_node("click").play()
	pass

