extends Node
var single=""
var scoreSingle=0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _singleInfoScore():
	return scoreSingle
	
func _singleEstado():
	return single
func _single(x,u):
	single=x
	scoreSingle=u
	print(single)
	print(scoreSingle)
