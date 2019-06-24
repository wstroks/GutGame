extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("animator").play("main")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_jogar_pressed():
	audio_player.play_click()
	pass # Replace with function body.


func _on_sobr_pressed():
	audio_player.play_click()
	pass # Replace with function body.


func _on_sair_pressed():
	audio_player.play_click()
	pass # Replace with function body.
